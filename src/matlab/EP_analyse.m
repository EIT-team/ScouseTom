function [OUTPUT]=EP_analyse(varargin)

if isempty(varargin) == 1
    
    HDR=ScouseTom_getHDR();
    
else
    fname_in = varargin{1};
    HDR=ScouseTom_getHDR(fname_in);
    
end

plot_flag =0;

%%
Fs = HDR.SampleRate;
[~, fname]=fileparts(HDR.FileName);

Trigger=ScouseTom_TrigReadChn(HDR);
TT=ScouseTom_TrigProcess(Trigger,HDR);

%% channel map
% specify channels
% becayse we use chn 5 as ref, we have to record all elecs 1-4.

% map_ = [9:19 25];
map_ = [ 7 8 9:18 25];
% map_ = [ 7 8 9 10 11];
% map_ = [5 6 7  9:18];

% map_=[3:4];

ref_chn=19;

Good_ch=map_;

%% Read the events in the file
% read the event timings as a number
% t=cell2mat({EEG.event.latency})';
%
% % find all the events which are of type "S 2" which are the stim ones
% jj=zeros(length(t),1);
% for i=1:length(t)
%     % if strcmp([EEG.event(1,i).type], ['R 12']);
%     if strcmp([EEG.event(1,i).type], ['S  2']);
%         jj(i)=1;
%     end
% end
%
% % samples in data when stim happens
% T_trig=t(jj==1);
% remove the beginning code related triggers, we dont want these ones

% T_trig = T_trig(200:end-100);
% T_trig = T_trig(3:end-3);


%% Timing


%% read the data
% get the voltages on the desired channels out of the EEG structure
Data= sread(HDR,inf,0);

% ref to elec 19
% Data=Data - repmat(Data(:,ref_chn),1,size(Data,2));


Data=Data(:,Good_ch);


%Data=detrend(Data);

%% filtering

Fc = 1200;
BW=1000;
% bandpass filter 1000hz cut off
[b,a] = butter(5,[Fc-BW/2 Fc+BW/2 ]./(Fs/2),'bandpass');
DataF = filtfilt(b,a,Data);

Data_demod = abs(hilbert(DataF));

% low pass filter 1000hz cut off
% [b,a] = butter(5,800/(Fs/2),'low');
% Data = filtfilt(b,a,Data);
% high pass 10 Hz
% [b,a] = butter(3,.1/(Fs/2),'high');
% Data = filtfilt(b,a,Data);

% notch at 50Hz
% % [b,a] = iirnotch(Fc/(Fs/2),(Fc/(Fs/2))/45);
% Data = filtfilt(b,a,Data);


%%

for iStim = 1:size(TT.Stimulations,2)
    
    T_trig=TT.Stimulations{iStim};
    % window in ms around event to view
    tau_max=500; % specify in ms
    
    % find max timing between stims
    Tmax=mean(floor((diff(T_trig)*1000)))/Fs;
    
    tau = min([ tau_max Tmax]);
    
    size_bin=floor(tau*Fs/1000); % convert to the number of samples this is equivalent to
    
    
    %% spliting into each stim event
    
    % make a Time vector - for plotting
    T=[1:size_bin]*1000/Fs;
    
    % pre allocate the Eps
    EP_dz=zeros(length(T_trig)-2,size_bin,length(Good_ch));
    EP=zeros(length(T_trig)-2,size_bin,length(Good_ch));
    
    % loop through every stime event and take the data either side of stim
    for iTrig=2:length(T_trig)-1
        EP_dz(iTrig-1,:,:)=Data_demod([T_trig(iTrig)-floor(size_bin/2):T_trig(iTrig)+ceil(size_bin/2)-1],:);
        EP(iTrig-1,:,:)=Data([T_trig(iTrig)-floor(size_bin/2):T_trig(iTrig)+ceil(size_bin/2)-1],:);
    end
    % EP is now Repeats x Samples x Channels
    
    % average all the EP chunks across repeats of EPs
    EP_dz_avg=detrend(squeeze(mean(EP_dz,1)));
    EP_avg=detrend(squeeze(mean(EP,1)));
    %EP_avg is now Samples x Channels
    
    
    %% plot the figure
    
    if plot_flag
        
        %    figure
        %   pwelch(EP_avg(:,2),[],[],25000,Fs);
        
        
        figure % new window
        % subplot(2,1,1)
        plot(T,EP_avg/1000);
        xlabel('Time ms');
        ylabel('EP mV');
        title(sprintf('EP in file %s Stimulation %d',fname,iStim))
        % xlim([tau_max/2 - 10   tau_max])
        xlim([247.5 270])
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        ylim([-20 5])
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        drawnow
        %   ylim([-40 40])
        %
        % pause(0.00001);
        % frame_h = get(handle(gcf),'JavaFrame');
        % set(frame_h,'Maximized',1);
        set(gcf,'units','normalized','outerposition',[0 0 1 1])
        
    end
    
    %%
    % subplot(2,1,2)
    % figure
    % % % xlim([20 50]);
    % plot(T,EP_dz_avg);
    % xlabel('Time ms');
    % ylabel('dZ uV');
    % xlim([245 285])
    % % %xlim([20 40])
    
    % ylim([-1 1]*5e3)
    
    
    %%
    
    % figure % new window
    % % subplot(2,1,1)
    % plot(T,EP_avg(:,1)/1000);
    % xlabel('Time ms');
    % ylabel('EP mV');
    % % xlim([tau_max/2 - 10   tau_max])
    % xlim([245 285])
    %
    %  ylim([-20 10])
    
    %%
    data = EP_avg(:,1)/1000;
    
    T0 = 248;
    T1 = T0 + 8;
    [~,idx1] = min(abs(T-T1));
    T2 = T0 + 16;
    [~,idx2] = min(abs(T-T2));
    T3 = T0 + 32;
    [~,idx3] = min(abs(T-T3));
    
    %Detect fisrt crossing of y = 0 after stimulation artefact this will be
    %start of first interval
    T_start = 251;
    t = find(T>T_start & T< T1);
    [~,idx_start] = min(abs(data(t)));
    idx_start = t(idx_start);
    T_start = T(idx_start);
    %
    T_int = [T_start, T1, T2, T3];
    idx_int = [idx_start,idx1,idx2,idx3];
    idx_cross = [];
    %% Detect Area and Peaks for each interval
    for iT = 1:length(T_int)-1
        t = find(T > T_int(iT) & T< T_int(iT+1));
        data_t = data(t);
        
        %this is really stupid. There must be a better way! Ask JAMEEEES?????
        %Incase it crosses y axis during the interval
        if any(data_t > 0)
            for is = 1:length(data_t)
                if data_t(is) < 0
                    sign(is) = -1;
                else
                    sign(is) = 1;
                end
            end
            diff_sign = diff(sign);
            cross_point = find(diff_sign ~= 0);
            if length(cross_point) <= 1
                cross_idx = 1;
                diff_mag = 1;
            end
            
            if length(cross_point) > 1
                diff_cross = diff(cross_point);
                diff_mag = find(diff_cross > 20);
                if isempty(diff_mag)
                    cross_idx = [1];
                else
                    cross_idx = find(diff_cross>20);
                end
            end
            
            
            
            for ic = 1:(length(cross_idx)+1)
                if ic == 1
                    cross_times(ic,:) = [1,cross_point(cross_idx(ic))];
                elseif ic == length(cross_idx)+1
                    cross_times(ic,:) = [cross_point(cross_idx(ic-1)),length(data_t)];
                else
                    cross_times(ic,:) = [cross_point(cross_idx(ic-1)),cross_point(cross_idx(ic))];
                end
            end
            
            
            idx_c = unique(cross_times);
            idx_c = t(idx_c);
            t_cross = T(idx_c);
            idx_cross = [idx_cross,idx_c];
            
            
            for iC = 1:length(cross_times)
                t_iC = t(cross_times(iC,1):cross_times(iC,2));
                A(iC) = trapz(data_t(cross_times(iC,1):cross_times(iC,2)));
                if A(iC) > 0
                    [P(iC),t_p(iC)] = max(data_t(cross_times(iC,1):cross_times(iC,2)));
                else
                    [P(iC),t_p(iC)] = min(data_t(cross_times(iC,1):cross_times(iC,2)));
                end
                t_p(iC) = t_iC(t_p(iC));
            end
            
            t_p = T(t_p);
            
            OUTPUT{iT}.A = A;
            OUTPUT{iT}.P = P;
            OUTPUT{iT}.T_c = t_cross;
            OUTPUT{iT}.T_p = t_p;
            OUTPUT{iT}.Interval = [T_int(iT),T_int(iT+1)];
            
        else
            
            A = trapz(data_t);
            [P,t_p] = min(data_t);
            t_p = T(t(t_p));
            OUTPUT{iT}.A = A;
            OUTPUT{iT}.P = P;
            OUTPUT{iT}.T_p = t_p;
            OUTPUT{iT}.Interval = [T_int(iT),T_int(iT+1)];
        end
    end
    
    
    
    
    
    %%
    
    %% Print out to screen
    n_str = {'First', 'Second', 'Third'};
    for iInt = 1:3
        n = length(OUTPUT{iInt}.A);
        fprintf('\n\n%s Interval T = %d to %d\n', n_str{iInt}, round(OUTPUT{iInt}.Interval(1,1)), round(OUTPUT{iInt}.Interval(1,2)));
        fprintf('No of peaks detected = %d\n', n);
        
        if n > 1
            for iN = 1:n
                fprintf('\nArea   A = %.0f mVms\n', OUTPUT{iInt}.A(iN));
                fprintf('Peak   P = %.2f mV at T_p = %.2f ms\n', OUTPUT{iInt}.P(iN), OUTPUT{iInt}.T_p(iN));
            end
        else
            fprintf('Area   A = %.0f mVms\n', OUTPUT{iInt}.A);
            fprintf('Peak   P = %.2f mV at T_p = %.2f ms\n', OUTPUT{iInt}.P, OUTPUT{iInt}.T_p);
            
        end
    end
    
    
    %%
    
    if plot_flag
        
        %Plot bar charts of area
        figure
        subplot(2,1,1)
        bar([OUTPUT{1}.A ,OUTPUT{2}.A, OUTPUT{3}.A]);
        ylabel('mVms');
        title('Area Under Curve');
        
        subplot(2,1,2)
        bar([OUTPUT{1}.P ,OUTPUT{2}.P, OUTPUT{3}.P]);
        ylabel('mV');
        title('Peak Value');
        
        
        figure; plot(T,data)
        hold on; plot([T(idx_start), T(idx_start)], [-20,5],'k')
        hold on; plot([T(idx1), T(idx1)], [-20,5], 'k')
        hold on; plot([T(idx2), T(idx2)], [-20,5], 'k')
        hold on; plot([T(idx3), T(idx3)], [-20,5],'k')
        for iP = 2:length(idx_cross)-1
            hold on; plot([T(idx_cross(iP)), T(idx_cross(iP))], [-10,5],'k--')
        end
        hold on; plot([240,290], [0,0], 'k');
        xlim([247.5 285]);
        ylim([-20 5]);
        xlabel('Time ms');
        ylabel('EP mV');
        hold off;
        
    end
    
    %clearvars -except AREA PEAK T_PEAK HDR FS fname Trigger TT map_ ref_chn Good_ch Data_demod iStim
end




