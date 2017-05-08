% close all
% clear all
 % path_n='E:\GSK\Sheep_8';
% files=dir('EIT*.vhdr');
% files={files.name};

%for ffil = 2
   
   
   EIT_fname = 'CAP_search_serv_stim_50us_2mA.vhdr';
  % EIT_fname = files{ffil};
   
   log_f=dir([EIT_fname(1:end-5) '_log*.mat']);
   log_f=log_f.name;
   load(log_f);
 
   map_p=[1:2]; % Montage
   map_=[1:2];
   
   ring = [1:2];
     
   EP_cutoff = 3000;  % cutoff frequency for EPs (low-pass freq.)
   dZ_BW = 3000;      % Bandwidth for demodulation
   N_butter_EP = 5; % Butterworth order for filtering EPs
   N_butter_dZ = 5;  % Butterworth order for filtering dZs
   N_butter_notch = 3; % Butterworth order for notch filtering    
   Noise_thres = 100000;  % Noise threshold (in uV)
   Filter_50Hz = true; % 50 Hz notch filter on EPs
   Plot_chan = [1:length(map_)];
   T_window = 0.05; % time to take around trigger
  % tau = T_window*1000;
%% find all prt switches
  % chdir(path_n);    
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

%  EEG = pop_loadbv('',EIT_fname,[SWITCH(1)+Fs SWITCH(1)+10*Fs]);
%  EEG.data=EEG.data(map_p,:);
%  V_inj = detrend(double(EEG.data(map_==Prt(1,2),:)'),'constant'); 
%  
%   NFFT = 2^nextpow2(length(V_inj)); % Next power of 2 from length of y
% Y = fft(V_inj,NFFT)/length(V_inj);
% f = Fs/2*linspace(0,1,NFFT/2+1);
% w_ind=2*abs(Y(1:NFFT/2+1));
%  %plot(f,w_ind) 
%  
%  [~,maxw] = max((w_ind));
%  Fc = f(maxw);
%   disp(sprintf('****** Detected carrier frequency: Fc = %i Hz ******',Fc));
 
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
      T_trig=T_trig(3:end-4);
      
%       if remove_mid_trig
%           k_s = round(size(EEG.data,2)/2);
%           T_trig(T_trig > k_s-Fs/2 & T_trig < k_s+Fs/2)=[];
%       end
      
      T_stim = mean(T_trig(2:end)-T_trig(1:end-1))/Fs;
      disp(['Siimulation every ' num2str(round(T_stim*1000)) ' ms']);
      
 
  
 %%
 
    Data = double(EEG.data');
 [b,a] = butter(3,1/(Fs/2),'high');
  Data = filtfilt(b,a,Data);   
%   [b,a] = butter(5,4000/(Fs/2),'low');
%   Data = filtfilt(b,a,Data);   
   tau=30;
 size_bin=floor(tau*Fs/1000);
   T=[1:size_bin]*1000/Fs-tau/2;
 
 EP=zeros(length(T_trig)-2,size_bin,size(Data,2));
 for i=2:length(T_trig)-1
     EP(i-1,:,:)=Data([T_trig(i)-floor(size_bin/2):T_trig(i)+floor(size_bin/2)-1],:);
 end
 
%  for i=1:length(T_trig)-1
%      EP(i,:,:)=Data([T_trig(i)-floor(size_bin/2):T_trig(i)+floor(size_bin/2)-1],:);
%  end
 
 EP_avg=detrend(squeeze(mean(EP,1)));
   
    


        
        subplot(round(sqrt(Prt_size))+1,round(Prt_size/round(sqrt(Prt_size))),iPair);
      
        %figure;
      %  [b,a] = butter(3,1/(Fs/2),'high');
       % plot(T,detrend(filtfilt(b,a,avg_dZ_abs(:,Plot_chan))))
       Plot_chan = [1:2];% find(std(avg_dZ_abs(T<-1,:))<3);
        %plot(T,detrend(filtfilt(b,a,avg_dZ_abs(:,Plot_chan))));
        %if(nnz(Plot_chan))>0
        plot(T,EP_avg);
        title(['Pair=' num2str(iPair)]);
        ylim([-130,130])
        xlim([-1,8])
        grid on
        ylabel('CAP (uV)')
     
        strtt = EIT_fname(1:end-4);
        strtt(strtt=='_')= ' ';
   
    drawnow;
      
    end
   
   

% figure('name',sprintf('EIT %s iPair %02i (%i, %i) [Fc: %i]',...
%                       strtt,iPair,Prt(iPair,1),...
%                       Prt(iPair,2),Fc),'Position',[10,50,1900,950],'PaperPositionMode','auto'); 
% for iPair=1:Prt_size  
%         
%          subplot(round(sqrt(Prt_size))+1,round(sqrt(Prt_size)),iPair);
%        
%         bar(EIT{iPair}.BV0);
%         [~,k]=ismember(EIT{iPair}.Pair,ring);
%         title(['Pair  ' num2str(k)]);
% end

%end
%save([EIT_fname(1:end-5) '_BW3000.mat'],'EIT','-v7.3');
%       
%       
      
%end      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      