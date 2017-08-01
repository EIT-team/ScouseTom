HDR=ScouseTom_getHDR;

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
 
end




