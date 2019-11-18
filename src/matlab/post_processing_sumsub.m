% clc;
% close all;
% clear all;

%files=dir('*EIT*.vhdr');
name = '9_100ua_eit911';

% EIT I frequency
Fc = 225; % can be computed, see below

files=dir([name '.vhdr']);

% Lookd at PhaseOrder - Ilya

files={files.name};

for ffil = 1:length(files)
    
    EIT_fname = files{ffil};
    
    log_f=dir([EIT_fname(1:end-5) '_log*.mat']);
    log_f=log_f.name;
    load(log_f);
    
    % Electrode numbering on Actichamp
%     map_p=[1:7];
%     map_=[1:7];
   
    
    % Parameters for post-processing
    EP_cutoff = 100;  % cutoff frequency for EPs (low-pass freq.)
    dZ_BW = 100;      % Bandwidth for demodulation
    N_butter_EP = 3; % Butterworth order for filtering EPs
    N_butter_dZ = 3;  % Butterworth order for filtering dZs
    N_butter_notch = 3; % Butterworth order for notch filtering
    Noise_thres = 1000;  % Noise threshold (in uV)
    Filter_50Hz = true; % 50 Hz notch filter on EPs
    T_window = 0.4; % time to take around trigger
    
    %% Find all protocol switches
    
    HDR= sopen([EIT_fname(1:end-5) '.eeg']);
    Fs=HDR.SampleRate;
    
%     SWITCH=HDR.EVENT.POS;
%     
%     for i=1:length(SWITCH)
%         if ~(strcmp([HDR.EVENT.Desc{i}], ['S  3']) || strcmp([HDR.EVENT.Desc{i}], ['S  1']))
%             SWITCH(i)=0;
%         end
%     end
    
%     SWITCH(SWITCH==0)=[];
%     SWITCH=SWITCH(2:end);
%     
%     SWITCH = [SWITCH;2*SWITCH(end)-SWITCH(end-1)];
    

pulses=strcmp([HDR.EVENT.Desc], ['S  2']);
SWITCH=[HDR.EVENT.POS(find(pulses==1,1,'first')) HDR.EVENT.POS(find(pulses==1,1,'last'))];

    
    Prt = ExpSetup.Protocol;
    Prt_size = size(Prt,1);
    
    % REMAPPING - ILYA. don't really need this 
    map_il = [1:20; 1:2:15 16 19:2:23 24:31];
    
    for i = 1 : 2
        for k = 1:size(map_il,2)
        if Prt(i) == map_il(2,k)
            Prt(i) = map_il(1,k);
        end
        end
    end
    
    %{
%     if (Prt_size+1==size(SWITCH,1))
%         disp('All data seemed to be there');
%     elseif (Prt_size+1>size(SWITCH,1))
%         disp('Protocol size is bigger than the number of switches in the file');
%         Prt_size=size(SWITCH,1)-1;
%     else
%         disp('Protocol size is smaller than the number of switches in the file!'); %%, assuming repeated protocol');
%         %%write stuff to handle this
%     end
    
%     EEG = pop_loadbv('',EIT_fname,[SWITCH(1)+Fs SWITCH(1)+10*Fs]);
    
%     EEG.data=EEG.data(:,:);
    
    
    %% Not clear why it looks for injection on map_==Prt(1,2) but it is only for carrier detection so don't really care - Enrico
    
    V_inj = detrend(double(EEG.data(map_il(1,:)==Prt(1,1),:)'),'constant');
    NFFT = 2^nextpow2(length(V_inj));           % Next power of 2 from length of y
    Y = fft(V_inj,NFFT)/length(V_inj);
    f = Fs/2*linspace(0,1,NFFT/2+1);
    w_inj=2*abs(Y(1:NFFT/2+1));
    
    [~,maxw] = max((w_inj));
    Fc1 = f(maxw); % Fc = ExpSetup.Freq;
%     fprintf('****** Detected carrier frequency: Fc = %i Hz ******\n',Fc1);
    %}
    
    %% Processing on each pair
    
    EIT = [];
%     hhplots = figure('Position',[10,50,1900,950],'PaperPositionMode','auto');
%     hhplots = figure;
    for iPair = 1:Prt_size
        
        fprintf('Processing protocol line %02i / %02i\n',iPair,Prt_size);
        
        EEG = pop_loadbv( '',EIT_fname,[SWITCH(iPair) SWITCH(iPair+1)]);
        
        %EEG.data=EEG.data(:,:);
        
        T_trig=cell2mat({EEG.event.latency})';
                
        for i=1:length(T_trig)
            if ~strcmp([EEG.event(1,i).type], ['S  2']);
                T_trig(i)=0;
            end
        end
        
        T_trig(T_trig==0 | T_trig < 1e5)=[]; % Edited by Ilya
        T_trig=T_trig(1:end-2);
        
        % MANUAL INSERTION OF THE MISSED EVENT MARK (5_100ua_12_eit56_1025)
        if strcmp(name, '5_100ua_12_eit56_1025')
            buf = T_trig(42:end); T_trig(42) = 4227850; T_trig(43:end+1) = buf;
        end
        
        Data = double(EEG.data');
        
        if Filter_50Hz
            [b_n,a_n] = iirnotch(50/(Fs/2),(50/(Fs/2))/(35));
            Data = filtfilt(b_n,a_n,Data);
            %{
            X_ep = Data;
            for flt = (50:50:1000)
                [b,a] = iirnotch(flt/(Fs/2),(flt/(Fs/2))/(35));
                Data = filtfilt(b,a,Data);
            end
            %}
        end
        
 
        % Number of channels, triggers, bins
        N_chan = size(Data,2);
        N_trig = length(T_trig);
        N_bin = round(T_window*Fs);
        w = (1:N_bin)-round(N_bin*0.5);    % window around trigger
        T = 1e3*w/Fs;
%         t0 = find(T>-5 & T<-1);
        
        % Cutting non-filtered signal (except for 50 Hz notch)
        EP0 = cell(1,N_chan); 
        for iChan = 1:N_chan
            EP0{iChan} = zeros(N_bin,N_trig); 
            for jTrig = 1:N_trig
                ival = T_trig(jTrig)+w;
                EP0{iChan}(:,jTrig) = Data(ival,iChan);
            end
        end
        
        % Find the correct phase-antiphase pair. Identical in every
        % channel
        [b,a] = butter(N_butter_dZ,(Fc+dZ_BW*[-1,1])/(Fs/2));
        t0 = round(0.1*T_window*Fs:0.2*T_window*Fs);
        for jTrig = 1:3 % checking only 1-2,2-3 and 3-4, make it higher if error
            ph = rad2deg(unwrap(angle(hilbert(filtfilt(b,a,EP0{1}(:,jTrig)))))-unwrap(angle(hilbert(filtfilt(b,a,EP0{1}(:,jTrig+1))))));
            deg = abs(mean(ph(t0))); % must be [179 181]
            % Removing wrong triggers
            if (deg > 178.5) && (deg < 181.5) && (jTrig ~= 1)
                T_trig(1:jTrig-1) = []; 
                for iChan = 1:N_chan
                    EP0{iChan}(:,1:jTrig-1) = [];
                end
                break;
            elseif (deg > 178.5) && (deg < 181.5) && (jTrig == 1)
                break;
            end
        end
        
        % T_trig must be even
        if mod(length(T_trig),2) ~= 0
            T_trig(end) = [];
            for iChan = 1:N_chan
                EP0{iChan}(:,end) = [];
            end
        end
        
        % Recalculating number of triggers
        N_trig = length(T_trig);
        
        T_stim_all = T_trig(2:end)-T_trig(1:end-1);
        T_stim = mean(T_stim_all)/Fs;
        disp(['Stimulation every ' num2str(round(T_stim*1000)) ' ms']);
        
        % Summation-subtraction
        % Subtraction for dZ
        EP_subt = cell(1,N_chan); 
        for iChan = 1:N_chan
            EP_subt{iChan} = zeros(N_bin,N_trig/2); 
            for jTrig = 1:N_trig/2
                EP_subt{iChan}(:,jTrig) = EP0{iChan}(:,2*jTrig-1) - EP0{iChan}(:,2*jTrig);
            end
        end
        % Summation for EPs
        EP_sum = cell(1,N_chan); 
        for iChan = 1:N_chan
            EP_sum{iChan} = zeros(N_bin,N_trig/2); 
            for jTrig = 1:N_trig/2
                EP_sum{iChan}(:,jTrig) = EP0{iChan}(:,2*jTrig-1) + EP0{iChan}(:,2*jTrig);
            end
        end
        
        % Band-pass filtering for dZ
        EP_subt_filt = cell(1,N_chan); 
        for iChan = 1:N_chan
            for j = 1 : size(EP_subt{iChan},2)
                EP_subt_filt{iChan}(:,j) = filtfilt(b,a,EP_subt{iChan}(:,j));
            end
        end
        
        % Low-pass filtering for EPs
        [b_low,a_low] = butter(N_butter_EP,EP_cutoff/(Fs/2),'low');
        EP_lpf = cell(1,N_chan); 
        for iChan = 1:N_chan
            for j = 1 : size(EP_subt{iChan},2)
                EP_lpf{iChan}(:,j) = filtfilt(b_low,a_low,EP_sum{iChan}(:,j))./2;
            end
        end
        
        % Demodulation
        dZ = cell(1,N_chan); dZ_nobpf = cell(1,N_chan); 
        for iChan = 1:N_chan
            for j = 1 : size(EP_subt_filt{iChan},2)
                dZ{iChan}(:,j) = abs(hilbert(EP_subt_filt{iChan}(:,j)))./2; % Dividing by 2 as sum-sub
                dZ_nobpf{iChan}(:,j) = abs(hilbert(EP_subt{iChan}(:,j)))./2; % Dividing by 2 as sum-sub
            end
        end
        
        % Averaging + detrending (2 ways)
        t0 = round(0.1*T_window*Fs:0.2*T_window*Fs); % for detrending and percentage values
        
        dZ_mean = cell(1,N_chan); dZ_mean_nobpf = cell(1,N_chan); EP_mean = cell(1,N_chan); 
        dZ_mean_d = cell(1,N_chan);dZ_mean_d1 = cell(1,N_chan);dZ_mean_d1_nobpf = cell(1,N_chan);
        for iChan = 1:N_chan
            EP_mean{iChan} = detrend(mean(EP_lpf{iChan},2));
            dZ_mean{iChan} = mean(dZ{iChan},2); 
            dZ_mean_nobpf{iChan} = mean(dZ_nobpf{iChan},2);
            dZ_mean_d1{iChan} = dZ_mean{iChan} - mean(dZ_mean{iChan}(t0));
            dZ_mean_d1_nobpf{iChan} = dZ_mean_nobpf{iChan} - mean(dZ_mean_nobpf{iChan}(t0));
            dZ_mean_d{iChan} = detrend(mean(dZ{iChan},2));
        end
        
        % Boundary voltages
        bv = zeros(1,N_chan);
        for iChan = 1:N_chan
            bv(iChan) = mean(dZ_mean{iChan}(round(0.2*T_window*Fs:0.8*T_window*Fs)));
        end
        
        % Percentage dZ
        dZ_p = cell(1,N_chan);
        for iChan = 1:N_chan
            for k = 1 : size(dZ{1},1)
                dZ_p{iChan}(k) = 100*(-mean(dZ_mean{iChan}(t0))+dZ_mean{iChan}(k))/mean(dZ_mean{iChan}(t0));
            end
        end
        
        [b1,a1] = butter(N_butter_EP,5000/(Fs/2),'low');
        figure;
        for i = 2 : 5
            plot(T,filtfilt(b1,a1,dZ_mean_d1_nobpf{i}));
            hold on;
        end
        ylim([-0.4 0.4]*1e3);xlim([-40 40]);
        xlabel('Time (ms)');ylabel('\muV');
        title([num2str(Fc) ' Hz']);
        legend;
        
        figure;plot(bar(bv))
        %{
        % Get results of each channel in matrices
        EP = cell(1,N_chan); EP1 = cell(1,N_chan);
        DC   = cell(1,N_chan); 
        dZ0 = cell(1,N_chan); dZ1 = cell(1,N_chan); dZ = cell(1,N_chan);
        BV = cell(1,N_chan);
        for iChan = 1:N_chan
            EP{iChan} = zeros(N_bin,N_trig); 
            EP1{iChan} = zeros(N_bin,N_trig);
            dZ{iChan} = zeros(N_bin,N_trig); 
            dZ0{iChan} = zeros(N_bin,N_trig);%dZ1{iChan} = zeros(N_bin,N_trig);
            BV{iChan} = zeros(1,N_trig);
            
            % iterate over triggers / edited by Ilya
            for jTrig = 1:N_trig
                ival = T_trig(jTrig)+w;
                EP1{iChan}(:,jTrig) = detrend(X_ep(ival,iChan),'constant');
                EP{iChan}(:,jTrig) = EP0{iChan}(:,jTrig)-mean(EP0{iChan}((0.1:0.2).*N_bin,jTrig)); % more accurate than detrend
                DC{iChan}(:,jTrig) = mean(EP0{iChan}(:,jTrig));
                dZ1{iChan}(:,jTrig) = detrend(A_dz(ival,iChan),'constant');
                dZ0{iChan}(:,jTrig) = A_dz(ival,iChan);
                dZ{iChan}(:,jTrig) = dZ0{iChan}(:,jTrig)-mean(dZ0{iChan}((0.1:0.2).*N_bin,jTrig)); % more accurate than detrend
                BV{iChan}(jTrig) = mean(A_dz(ival,iChan));
            end
        end
        
        
        % Band-pass filter and demodulate
        [b_b,a_b] = butter(N_butter_dZ,(Fc+dZ_BW*[-1,1])/(Fs/2));
%         [b,a] = butter(1,(Fc+dZ_BW*[-1,1])/(Fs/2));
        X_dz = filtfilt(b_b,a_b,Data);
        X_dz_h = hilbert(X_dz);
        A_dz   = abs(X_dz_h);              % amplitude
        
        %         Low-pass filter to retrieve EP's
        [b,a] = butter(N_butter_EP,EP_cutoff/(Fs/2),'low');
        X_ep = filtfilt(b,a,Data);
%         X_ep = Data;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        

%         disp('essential stuff done');
        % Compute average / std. error for EP, dZ, dPhi
        avg_EP = zeros(N_bin,N_chan);
        avg_dZ_rel = zeros(N_bin,N_chan);
        avg_dZ_abs = zeros(N_bin,N_chan);
        BV0=zeros(N_chan,1);
        DC_avg=zeros(N_chan,1);
              
        for iChan = 1:N_chan
            ep = EP1{iChan};
            dz = dZ1{iChan};
            bv = repmat(BV{iChan},N_bin,1);            
            avg_EP(:,iChan) = mean(ep,2)-mean(reshape(ep(t0,:),[],1)); % ???
            avg_dZ_abs(:,iChan) = mean(dz,2)-mean(reshape(dz(t0,:),[],1));
            avg_dZ_rel(:,iChan) = 100*mean(dz./bv,2);
            avg_dZ_rel(:,iChan) = avg_dZ_rel(:,iChan)-mean(avg_dZ_rel(t0,iChan));
            BV0(iChan)=mean(mean(bv,2));   
            DC_avg(iChan)=mean(DC{iChan});
        end
              
        EIT{iPair}.Pair = Prt(iPair,:);
        EIT{iPair}.EP_avg=avg_EP;
        EIT{iPair}.dZ_avg=avg_dZ_abs;
        EIT{iPair}.BV0=BV0;
        EIT{iPair}.DC_avg=DC_avg;
        EIT{iPair}.ch_max_abs=max(abs(Data));
        
%         subplot(round(sqrt(Prt_size))+1,round(Prt_size/round(sqrt(Prt_size))),iPair);
        
        % Original plot (selective)
%         Plot_chan = [1:length(map_)];
        Plot_chan = find(std(avg_dZ_abs(T<-1,:))<100000);
        if(nnz(Plot_chan))>0
            plot(T,avg_dZ_abs(:,Plot_chan));
            title(['Pair=' num2str(iPair)]);
%             ylim([-20,20])
            xlim([-5,25])
            grid on
            ylabel('dZ (uV)')
        end
        
        strtt = EIT_fname(1:end-4);
        strtt(strtt=='_')= ' ';
        drawnow;
        %}
    end
    
%     save([EIT_fname(1:end-5) '_lite_BW2K.mat'],'EIT','T','Fs','Fc','-v7.3');
    
end

%{
% Extracting pairs of phases
cnt = 1; ind = zeros(2,1);
for i = 1 : length(PhaseOrder)
    for k = i+1 : length(PhaseOrder)
        if (PhaseOrder(k) == PhaseOrder(i)+180) || (PhaseOrder(k) == PhaseOrder(i)-180)
            PhPairs(1,cnt) = PhaseOrder(i);
            PhPairs(2,cnt) = PhaseOrder(k);
            ind(1,cnt) = i; ind(2,cnt) = k;
            cnt = cnt + 1;
        end
    end
end
    %}