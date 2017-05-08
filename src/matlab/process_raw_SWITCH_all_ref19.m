% close all
% clear all
 % path_n='E:\GSK\Sheep_9';
% files=dir('EIT*.vhdr');
% files={files.name};

%for ffil = 2
   
   
   EIT_fname = 'EIT_Pulmonary_6kHz_300uA_stim_50us_5mA_ref1_prt_X.vhdr';
  % EIT_fname = files{ffil};
   
   log_f=dir([EIT_fname(1:end-5) '_log*.mat']);
   log_f=log_f.name;
   load(log_f);
 
   map_p=[1:29]; % Montage
   %map_=[1:18,20:30];
   map_=[2:30];
   
   ring = [14 8 3 13 26 21 6 11 20 25 30 2 7 12 29 24 18 10 5 17 28 23 16 9 4 22 27 15 1];
     
   EP_cutoff = 2000;  % cutoff frequency for EPs (low-pass freq.)
   dZ_BW = 2000;      % Bandwidth for demodulation
   N_butter_EP = 5; % Butterworth order for filtering EPs
   N_butter_dZ = 5;  % Butterworth order for filtering dZs
   N_butter_notch = 3; % Butterworth order for notch filtering    
   Noise_thres = 100000;  % Noise threshold (in uV)
   Filter_50Hz = true; % 50 Hz notch filter on EPs
   Plot_chan = [1:length(map_)];
   T_window = 0.05; % time to take around trigger
 
%% find all prt switches
   %chdir(path_n);    
   HDR= sopen([EIT_fname(1:end-5) '.eeg']);
   Fs=HDR.SampleRate;
   
   
   SWITCH=HDR.EVENT.POS;

    for i=1:length(SWITCH)
       if ~(strcmp([HDR.EVENT.Desc{i}], ['S  3']) || strcmp([HDR.EVENT.Desc{i}], ['S  1']))
          SWITCH(i)=0;
       end
    end

    
    
    SWITCH(SWITCH==0)=[];
    SWITCH=SWITCH(2:end);
    
    remove_mid_trig =0;
    if length(SWITCH) >30
        SWITCH=SWITCH(1:2:end);
        remove_mid_trig =1;
    end
    
    SWITCH = [SWITCH;2*SWITCH(end)-SWITCH(end-1)];
% Load Prt and check that switches are ok
 %disp(['Loading protocol file ',Prt_name, ' ...']);
 Prt = ExpSetup.Protocol;
 Prt_size = size(Prt,1);
 
 if (Prt_size+1==size(SWITCH,1))
     disp('All data seemed to be there');
 elseif (Prt_size+1>size(SWITCH,1))
     disp('Protocol size is bigger than the number of switches in the file');
     Prt_size=size(SWITCH,1)-1;
 else
     disp('Protocol size is smaller than the number of switches in the file!'); %%, assuming repeated protocol');
     %%write stuff to handle this
 end

 EEG = pop_loadbv('',EIT_fname,[SWITCH(1)+Fs SWITCH(1)+10*Fs]);
 EEG.data=EEG.data(map_p,:);
 V_inj = detrend(double(EEG.data(map_==Prt(1,2),:)'),'constant'); 
 
  NFFT = 2^nextpow2(length(V_inj)); % Next power of 2 from length of y
Y = fft(V_inj,NFFT)/length(V_inj);
f = Fs/2*linspace(0,1,NFFT/2+1);
w_ind=2*abs(Y(1:NFFT/2+1));
 %plot(f,w_ind) 
 
 [~,maxw] = max((w_ind));
 Fc = f(maxw);
  disp(sprintf('****** Detected carrier frequency: Fc = %i Hz ******',Fc));
 
 %%
EIT = [];  
 
 hhplots = figure('Position',[10,50,1900,950],'PaperPositionMode','auto');
                  
  %%      
  
for iPair = 1:Prt_size
      
      disp(sprintf('Processing protocol line %02i / %02i',iPair,Prt_size));
      
      EEG = pop_loadbv( '',EIT_fname,[SWITCH(iPair) SWITCH(iPair+1)]);
      
      EEG.data=EEG.data(map_p,:);
      
      T_trig=cell2mat({EEG.event.latency})';

      %%THIS MIGHT BE DIFFERENT NOW!
      
      for i=1:length(T_trig)
         if ~strcmp([EEG.event(1,i).type], ['S  2']);
           T_trig(i)=0;
         end
      end
      
      T_trig(T_trig==0)=[];
      T_trig=T_trig(4:end-3);
      
      if remove_mid_trig
          k_s = round(size(EEG.data,2)/2);
          T_trig(T_trig > k_s-Fs/2 & T_trig < k_s+Fs/2)=[];
      end
      
      T_stim = mean(T_trig(2:end)-T_trig(1:end-1))/Fs;
      disp(['Siimulation every ' num2str(round(T_stim*1000)) ' ms']);
      
 
  
 %%
 
    Data = double(EEG.data');
    
    if Fc<=300
        dZ_BW = 50;
        EP_cutoff = 100;
    end
    
 
    % Low-pass filter to retrieve EP's
    [b,a] = butter(N_butter_EP,EP_cutoff/(Fs/2),'low');
    X_ep = filtfilt(b,a,Data);
    if Filter_50Hz
        [b,a] = iirnotch(50/(Fs/2),(50/(Fs/2))/35);
        X_ep = filtfilt(b,a,X_ep);
    end
    
    % Band-pass filter and demodulate
    [b,a] = butter(N_butter_dZ,(Fc+dZ_BW*[-1,1])/(Fs/2));
    X_dz = filtfilt(b,a,Data);
    X_dz = hilbert(X_dz);
    A_dz   = abs(X_dz);              % amplitude
%     if Filter_50Hz
%          [b,a] = iirnotch(50/(Fs/2),(50/(Fs/2))/10);
%          A_dz = filtfilt(b,a,A_dz);
%          
%          [b,a] = iirnotch(100/(Fs/2),(100/(Fs/2))/10);
%          A_dz = filtfilt(b,a,A_dz);
%      end
    
    % Number of channels, triggers, bins
    N_chan = size(Data,2);
    N_trig = length(T_trig);
    N_bin = round(T_window*Fs);
    w = (1:N_bin)-round(N_bin*0.5);    % window around trigger
    T = 1e3*w/Fs;
    t0 = find(T>-5 & T<-1);
    
    % Get results of each channel in matrices
    EP   = cell(1,N_chan);
    dZ   = cell(1,N_chan);
    BV = cell(1,N_chan);
    for iChan = 1:N_chan
        EP{iChan} = zeros(N_bin,N_trig);
        dZ{iChan} = zeros(N_bin,N_trig);
        BV{iChan} = zeros(1,N_trig);
        
        % iterate over triggers
        for jTrig = 1:N_trig
            ival = T_trig(jTrig)+w;
            EP{iChan}(:,jTrig) = detrend(X_ep(ival,iChan),'constant');
            dZ{iChan}(:,jTrig) = detrend(A_dz(ival,iChan),'constant');
            BV{iChan}(jTrig) = mean(A_dz(ival,iChan));
        end
    end

    % Find trials with low noise
    Trial_sel = [];
    for iChan = setdiff(1:N_chan,[Prt(iPair,:)])
        Trial_sel = [Trial_sel; BV{iChan}>1e2 ...
                    & max(abs(dZ{iChan}))<Noise_thres];
    end
    good_chan = sum(Trial_sel,2)>size(Trial_sel,2)/2;
% $$$     disp(sprintf('%i good channels',nnz(good_chan)))
    Trial_sel = sum(Trial_sel(good_chan,:))>nnz(good_chan)/2;
    N_trial = nnz(Trial_sel);
    Trial_sel = Trial_sel;
    disp(sprintf('Removed %i trials (out of %i) for excessive noise',N_trig-N_trial,N_trig))
    
    % Compute average / std. error for EP, dZ, dPhi 
    avg_EP = zeros(N_bin,N_chan);
    avg_dZ_rel = zeros(N_bin,N_chan);
    avg_dZ_abs = zeros(N_bin,N_chan);
    BV0=zeros(length(ring),1);
    
    [~,mm]=max(Data(:,1));
    invert = Data(mm,:)<0;
    
    for iChan = 1:N_chan
        ep = EP{iChan}(:,Trial_sel);
        dz = dZ{iChan}(:,Trial_sel);
        bv = repmat(BV{iChan}(Trial_sel),N_bin,1);        
        
        avg_EP(:,iChan) = mean(ep,2)-mean(reshape(ep(t0,:),[],1));
        avg_dZ_abs(:,iChan) = mean(dz,2)-mean(reshape(dz(t0,:),[],1));
        avg_dZ_rel(:,iChan) = 100*mean(dz./bv,2);            
        avg_dZ_rel(:,iChan) = avg_dZ_rel(:,iChan)-mean(avg_dZ_rel(t0,iChan));     
        if (~invert(iChan))
            BV0(ring==map_(iChan))=mean(mean(bv,2));
        else
            BV0(ring==map_(iChan))=-mean(mean(bv,2));
        end
        
    end

    
    
    EIT{iPair}.Pair = Prt(iPair,:);
    EIT{iPair}.EP_avg=avg_EP;
    EIT{iPair}.dZ_avg=avg_dZ_abs;
    EIT{iPair}.dZ=dZ;
    EIT{iPair}.BV0=BV0;
    
% Plot
    
%     if ~isempty(Plot_chan)
%         % create plot
%         figure('Position',[680,50,560,950],'PaperPositionMode','auto')
%         subplot(3,1,1)
%         plot(T,detrend(avg_EP(:,Plot_chan)))
%        % ylim([-500,500])
%         %xlim([-5,50])
%         grid on
%         ylabel('EP (uV)')
%         subplot(3,1,2)
%         plot(T,detrend(avg_dZ_abs(:,Plot_chan)))
%         %ylim([-30,30])
%         %xlim([-5,50])
%         grid on
%         ylabel('dZ (uV)')
%         
%         strtt = EIT_fname(1:end-4);
%         strtt(strtt=='_')= ' ';
%         
%         title(sprintf('EIT %s iPair %02i (%i, %i) [Fc: %i]',...
%                       strtt,iPair,Prt(iPair,1),...
%                       Prt(iPair,2),Fc))
%         subplot(3,1,3)
%         plot(T,detrend(avg_dZ_rel(:,Plot_chan)))
%         ylim([-0.2,0.2])
%         %xlim([-5,50])
%         grid on    
%         ylabel('dZ (%)')
%         xlabel('Time (ms)')
% %        print(gcf,sprintf('png2/EIT_%s_Ipair_%02i.png',EIT_serial,iPair),...
% %               '-dpng','-r300')
%        % close(gcf)
%     end

        
        subplot(round(sqrt(Prt_size))+1,round(Prt_size/round(sqrt(Prt_size))),iPair);
      
        %figure;
        [b,a] = butter(3,1/(Fs/2),'high');
       % plot(T,detrend(filtfilt(b,a,avg_dZ_abs(:,Plot_chan))))
       Plot_chan = find(std(avg_dZ_abs(T<-1,:))<3);
        %plot(T,detrend(filtfilt(b,a,avg_dZ_abs(:,Plot_chan))));
        if(nnz(Plot_chan))>0
        plot(T,avg_dZ_abs(:,Plot_chan));
        title(['Pair=' num2str(iPair)]);
        ylim([-10,10])
        xlim([-3,15])
        grid on
        ylabel('dZ (uV)')
        end
        strtt = EIT_fname(1:end-4);
        strtt(strtt=='_')= ' ';
   
    drawnow;
      
end
      

figure('name',sprintf('EIT %s iPair %02i (%i, %i) [Fc: %i]',...
                      strtt,iPair,Prt(iPair,1),...
                      Prt(iPair,2),Fc),'Position',[10,50,1900,950],'PaperPositionMode','auto'); 
for iPair=1:Prt_size  
        
         subplot(round(sqrt(Prt_size))+1,round(sqrt(Prt_size)),iPair);
       
        bar(EIT{iPair}.BV0);
        [~,k]=ismember(EIT{iPair}.Pair,ring);
        title(['Pair  ' num2str(k)]);
end

%end
save([EIT_fname(1:end-5) '_BW2000.mat'],'EIT','-v7.3');
%       
%       
      
%end      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      