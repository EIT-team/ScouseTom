function [ Vseg, lastPrt ] = segment_ind( data,InjSwitches,t_rem,N_prt,N_elec,Fs,varargin )
%segment_ind segments data
%   Detailed explanation goes here

%% data info

if isempty(varargin) ==1
    iPrt=1;
else
    tmp=varargin{1};
    %make sure it is a number
    if isnumeric(tmp) ==1
        %this is unessesary now
        if tmp ~= 1
            
            %if the next line is bigger than the number of protocol lines
            %then "wrap" it round
            if tmp>N_prt
                iPrt=tmp-N_prt;
                
            else
                iPrt=tmp;
                
            end
            
            
        else
            iPrt=1;
        end
    end
end

%% check for any anomalous short switches

%this is necessary to get rid of really quick events on the trigger channel
%as found in DAY 8/Bald_Nir_EZ at ~9532 seconds. This doesnt seem to
%correspond to an actual switch of electrodes, so im not sure what the deal
%is with that! but it can be removed ok

Sw_in=diff(InjSwitches); %time gap between swtiches
Sw_True=mode(Sw_in); %the most common switch

Bad_switches=find(Sw_in < fix(0.9*Sw_True) == 1)+1; %are any switches less than 90% of the "real" length

if ~isempty(Bad_switches) % if there are bad switches
    
    disp('Small switches found in the sequence, deleting');
    
    %precaution to stop it running forever
    maxit=length(Bad_switches);
    
    it=0;
    
    while ~isempty(Bad_switches) && it <= maxit
        
        it=it+1;
        
        InjSwitches(Bad_switches(1))=[]; % get rid of the first one, then see if this has fixed it
        Sw_in=diff(InjSwitches);
        Bad_switches=find(Sw_in < fix(0.9*Sw_True) == 1)+1;
        
    end
    
end




%% info for segmenting

s_rem=fix(t_rem*Fs); %samples to remove

s_int=max(max(diff(InjSwitches))); % interval in samples of each switch

N_switch=size(InjSwitches,1); %number of switches

N_rep=ceil(N_switch/N_prt); %number of repeats of protocol


%% segment data into injections

%calculate vector of trimmed segments
s_trim=[InjSwitches(:,1)+s_rem, InjSwitches(:,1)+s_int-s_rem];

% FIX LOADING DATA THAT ISNT THERE FOR VERY SHORT INJECTION
s_trim (s_trim > length(data)) = length(data);


%calculate segment width
seg_width=s_int-s_rem*2+1;

%create vector of voltages PRT x Voltage x CHN x Repeat
Vseg=nan(N_prt,seg_width,N_elec,N_rep);

%% segment that shit

% iPrt=1;
rep=1;

if N_rep > 1
    
    for injcnt = 1:N_switch
        
        Vseg(iPrt,:,:,rep)=data(s_trim(injcnt,1):s_trim(injcnt,2),:);
        
        iPrt=iPrt+1; %update Prt pointer
        
        if iPrt > N_prt
            iPrt=1;
            rep=rep+1;
        end
    end
    
else
    %if there is only 1 repeat then ignore the 4th dimension
    for injcnt = 1:N_switch
        vtmp=data(s_trim(injcnt,1):s_trim(injcnt,2),:);
        Vseg(iPrt,1:size(vtmp,1),:)=vtmp;
        iPrt=iPrt+1; %update Prt pointer
        
    end
end

%report what the last protocol line was. it is incremented in the loop
%above so take one off it
lastPrt=iPrt-1;

%if it is equal to zero that "wrap" it round to the last value
if lastPrt==0
    lastPrt=N_prt;
end

disp('Data segmented ok');
disp(['Last protocol line was ', num2str(lastPrt), ' of ', num2str(N_prt)]);
end

