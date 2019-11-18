function plot_CAP_w(filename)

EEG=pop_fileio(filename);
%%
Fs = EEG.srate;

map_p=[1:29]; % Montage
map_=[1:18,20:30]; %REF = 19

t=cell2mat({EEG.event.latency})';

jj=zeros(length(t),1);
for i=1:length(t)
    if strcmp([EEG.event(1,i).type], ['S  2']);
        jj(i)=1;
    end
end


T_trig=t(jj==1);
T_trig = T_trig(3:end-2);

tau=200;
size_bin=floor(tau*Fs/1000);

Data= double(EEG.data)';

%Data=detrend(Data);

[b,a] = butter(3,10000/(Fs/2),'low');
Data = filtfilt(b,a,Data);


[b,a] = iirnotch(50/(Fs/2),(50/(Fs/2))/25);
Data = filtfilt(b,a,Data(:,:));



T=[1:size_bin]*1000/Fs-tau/2;

EP=zeros(length(T_trig)-2,size_bin,size(Data,2));
for i=2:length(T_trig)-1
    EP(i-1,:,:)=Data([T_trig(i)-floor(size_bin/2):T_trig(i)+floor(size_bin/2)-1],:);
end
% assignin('base','EP',EP);
% assignin('base','EEG',EEG);
% assignin('base','Data',Data);
% assignin('base','T_trig',T_trig);

EP_avg=detrend(squeeze(mean(EP,1)));
assignin('base','EP_avg',EP_avg);
figure
plot(T,EP_avg(:,1:end));
legend;

xlim([-5,50]);
 ylim([-15000,10000])

