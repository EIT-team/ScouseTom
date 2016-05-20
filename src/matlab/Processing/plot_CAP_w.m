EEG=pop_loadbv;
%%
 Fs = EEG.srate;
 %Bad_channels = [2,5,6,10,11,14,17,18,20,22,24,25,28:32];
 % map_=[1:30]; % Montage
   %map_=[1 3 4 7 8 9 12 13 14 15 16 19 21 22 23 26 27 28]; % Actual numbering
 
 %Good_ch=setdiff(map,Bad_channels);
 %Good_ch=map_;
 
 
 
 t=cell2mat({EEG.event.latency})';
 
 jj=zeros(length(t),1);
 for i=1:length(t)
     if strcmp([EEG.event(1,i).type], ['S  2']);
       jj(i)=1;
     end
 end
 
 
 T_trig=t(jj==1);
        
 tau=100;
 size_bin=floor(tau*Fs/1000);
 
 Data= EEG.data';
 
 %Data=detrend(Data);
 
 [b,a] = butter(5,40000/(Fs/2),'low');
 Data = filtfilt(b,a,Data);
 
 
 
     [b,a] = iirnotch(50/(Fs/2),(50/(Fs/2))/25);
      Data = filtfilt(b,a,Data);
%  
%   [b,a] = butter(3,20/(Fs/2),'high');
%   Data = filtfilt(b,a,Data);
 % Data = Data-repmat(Data(1,:),size(Data,1),1);
 
  
  T=[1:size_bin]*1000/Fs-tau/2;
 
 EP=zeros(length(T_trig)-2,size_bin,size(Data,2));
 for i=2:length(T_trig)-1
     EP(i-1,:,:)=Data([T_trig(i)-floor(size_bin/2):T_trig(i)+floor(size_bin/2)-1],:);
 end
 
%  for i=1:length(T_trig)-1
%      EP(i,:,:)=Data([T_trig(i)-floor(size_bin/2):T_trig(i)+floor(size_bin/2)-1],:);
%  end
 
 EP_avg=detrend(squeeze(mean(EP,1)));
 
   figure 
  pwelch(EP_avg(:,2),[],[],25000,Fs);
 figure
 plot(T,EP_avg);