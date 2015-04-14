function [ Out  ] = ScouseTom_ReadEvents( HDR,varargin )
%readindicatorchn get contact impedance check and injection start stop and
%switching time from data recorded from arduino indicator pin
%   Inputs:
%   HDR - Header from sopen
%   Fs - smapling frequency
%   optional inputs:

%
%   Outputs:
%   Injection Switches - NanPadded matrix of smaples in IndicatorPinData where
%   injection pairs are swapped. MxN where N is number of separate injections
%   and M is largest number of switches
%   Contact Switches - as above but for contact checks
%   Injection start - position of start injection flags
%   injection stop - as above but stop
%   Contact Start - position of sstart contact check flags
%   contact stop - as above

%% variables used in thresholding

max_coef=1.1;
InjTriggerChn=0; %this is normally 0
eventtype=63487; %i dont know why is got to be but it do



%% find only correct type of events in injection trigger channel

%sample rate
Fs=HDR.SampleRate;
%number of samples in file
N_samples=HDR.NRec*Fs;

%look for events only on the current channel - chn 0

InjChnEvents=find(HDR.EVENT.CHN == InjTriggerChn);


%look for events of the correct type - this is 63487 but i dont know
%why. these are the start of the indication pin pulses from the arduino

if mode(HDR.EVENT.TYP(InjChnEvents)) ~= eventtype
    
    
    %if there are lots of events but not of the correct type then use the
    %most common type instead - this a fix for a few datasets where for
    %some reason it was different!
    if length(InjChnEvents) > 1
        
        warning('Unexpected event type, using the new one instead');
        eventtype=mode(HDR.EVENT.TYP(InjChnEvents));
    else
        %if less than 1 found then leave empty as 1 is ALways found!
        warning('No events found! :O  ');
    end
    
end



%read the appropriate events from the header

InjChnEvents=find(HDR.EVENT.TYP(InjChnEvents) == eventtype);



PulseStart=HDR.EVENT.POS(InjChnEvents);


if isempty(PulseStart)
    
    %if there are no pulses in the file then ask if this was a dataset
    %recorded with a separate channel for the indicator. This is for the
    %datasets recorded in 2013 before I wised up and used the trigger
    %channel
    disp('No Pulses in file');
    
    y='YES! As A matter of fact it was!';
    n='What? NO! That doesnt sound right at all!';
    
    indyn=questdlg('NO SWITCHES IN FILE! Was this an older dataset with a separate indicator pin? ','No switches found, possibly data from old version',y,n,y);
    
    
    %if user confrimed this is correct then ask for the channel which
    %corresponds to the indicator pin - usually 17
    if strcmp(indyn,y) ==1
        disp('User confirmed data was recorded when system used one channel for indicator pin rather than trigger channel');
        
        prompt={'Indicator Pin Channel - Check using BioSemi Read if Unsure'};
        dlg_title='Confirm Ind Pin Chn';
        def={'17'};
        
        indchn=inputdlg(prompt,dlg_title,1,def);
        
        if isempty(indchn) ==1
            error('user pressed cancel');
        end
        
        indchn=sscanf(indchn{1},'%f');
        
        %use subfunction to read the indicator pin and convert to "pulse
        %starts" rest of processing is the same
        
       PulseStart=ReadIndPin(indchn,HDR);
       
        
        
        
        
    else
        disp('User chose not to load indicator pin. Returning nothing');
        
        Out='Didnae find anything';
        return
    end
    
end


%% find contact impedance and data start
% events are coded by pulses of 500microseconds 500 microseconds apart- the
% codes are:
%  2 - start of injection
%  3 - start of contact check
%  4 - end of injection
%  5 - end of contact check



% contact check has three 500 microsecond pulses 500 microseconds apart, injection start
% has two. So the time between rising edges is 1000 microseconds

% threshold of pulse width - close to 500 microseconds
maxwidth = fix(max_coef*(1000e-6*Fs)); %rounded to nearest sample

%find the pulses which are close together
BelowThres = (diff(PulseStart) < maxwidth);

%use bwlabel to find connections in array
[S, NN]=bwlabel(BelowThres);

%initialse array of starting positions
InjectionStarts=[];
ContactStarts=[];
InjectionStops=[];
ContactStops=[];

%initialise counters
InjCnt=1;
ZCnt=1;
InjStopCnt=1;
ZStopCnt=1;

%for each connected pulse, find size and see if it is a injection or
%contact impedance start
for ii=1:NN
    
    %find the number samples with this code
    codetmp=find (S == ii);
    codesize=size(codetmp,1);
    
    
    switch codesize
        case 1 % injection start is 2 pulses so diff =1
            InjectionStarts(InjCnt)=codetmp(1);
            disp(['Injection start found at ', num2str(PulseStart(codetmp(1))/Fs),' s']);
            InjCnt=InjCnt+1;
        case 2 % contact start is 3 pulses so diff =2
            ContactStarts(ZCnt)=codetmp(1);
            disp(['Contact Check start found at ', num2str(PulseStart(codetmp(1))/Fs),' s']);
            ZCnt=ZCnt+1;
        case 3 % injection stop is 4 pulses so diff =3
            InjectionStops(InjStopCnt)=codetmp(1);
            disp(['Injection stop found at ', num2str(PulseStart(codetmp(1))/Fs),' s']);
            InjStopCnt=InjStopCnt+1;
        case 4 % contact stop is 5 pulses so diff =4
            ContactStops(ZStopCnt)=codetmp(1);
            disp(['Contact Check Stop found at ', num2str(PulseStart(codetmp(1))/Fs),' s']);
            ZStopCnt=ZStopCnt+1;
    end
end




%% find first switch for each contact and injection

% first contact switch is 3 pulses on from contact check start
ContactFirst = PulseStart(ContactStarts+3);
% first injection switch is 2 pulses on from injection start
InjectionFirst= PulseStart(InjectionStarts+2);

%if there is a stop with no start (if the data was chopped) then create a
%start at the first pulse in the data. This handles the cases where the
%beginning is missing and the arduino version with the coded stops was used

%if any stops were detected
if ~isempty(InjectionStops)
    %if some starts were detected
    if ~isempty(InjectionStarts)
        %if a stop is found before a start then add a start as the first pulse
        if InjectionStarts(1) > InjectionStops(1)
            disp('Injection Stop found BEFORE the first Injection start!');
            disp('Creating Injection start at first pulse in data');
            InjectionFirst=[PulseStart(1) InjectionFirst];
        end
    else
        disp('Orphaned Injection Stop found!');
        disp('Creating Injection start at first pulse in data');
        InjectionStarts(1)=PulseStart(1);
    end
end


%if any contact stops were detected
if ~isempty(ContactStops)
    %if some starts were detected
    if ~isempty(ContactStarts)
        %if a stop is found before a start then add a start as the first pulse
        if ContactStarts(1) > ContactStops(1)
            disp('Contact Stop found BEFORE the first Contact start!');
            disp('Creating Contact start at first pulse in data');
            ContactFirst=[PulseStart(1) ContactFirst];
        end
    else
        disp('Orphaned Contact Stop found!');
        disp('Creating Contact start at first pulse in data');
        ContactStarts(1)=PulseStart(1);
    end
end




% find if there are additional pulses unaccounted for before any starts in
% the data - this is for the case without the coded stops

ambiguous_data=0;

start_earliest=min([min(InjectionStarts) min(ContactStarts)]);

%if this is empty then there were no starts in file at all, so it is
%ambiguous as to whether this file includes an injection or contact check,
%so prompt user
 if isempty(start_earliest)
    %if there are no starts then data is ambiguous
    ambiguous_data=1;
elseif start_earliest > 1
    %if there are pulses without a start then it is ambiguous
    ambiguous_data=1;
end

if ambiguous_data ==1
    
    %ask user what this file contains
    data_type_flag=questdlg('Ambiguous Data at start of file. Does this file start with contact checks or normal protocol injection?','Data ambiguity','Normal Protocol Injection','Contact Checks','Normal Protocol Injection');
    
    if strcmp(data_type_flag,'Normal Protocol Injection') ==1
        disp('User set ambiguous data as protocl injection');
        disp('Setting Injection start flag at first pulse in data');
        InjectionFirst=[PulseStart(1) InjectionFirst];
    else
        disp('User set ambiguous data as contact check');
        disp('Setting contact check flag at first pulse in data');
        InjectionFirst=[PulseStart(1) InjectionFirst];
    end
end








%% find last switch for each contact and injection

%this should hopefully cope with chopped datasets - thanks to biosemi
%battery or overloading due to the reduced dynamic range of the biosemi

ContactEnd=nan(size(ContactFirst));
InjectionEnd=nan(size(InjectionFirst));

%get end of last contact injection

if isempty(ContactStops)
    %if no contact stops were found - either it is missing from the file or
    %its from an older dataset then estimate the last one
    
    for ii=1:length(ContactFirst)
        
        start_idx=find(PulseStart == ContactFirst(ii));
        
        %approximate switching from first 5 switches with a 5% overshoot
        
        switchmean=fix(mean(diff(PulseStart(start_idx:start_idx+5))));
        switch_approx=ceil(1.05*switchmean);
        
        %find the first instance when the switching time is greater than the
        %threshold.
        last_idx=find(diff(PulseStart(start_idx:end)) > switch_approx,1);
        
        
        if isempty(last_idx)
            % if the result is empty then the signal was either cut short - so use the
            % penultimate switch as this represents that last completed
            % injection or it was the last switch in the file and it was ebfore i coded the stop pulses
            
            tmp=PulseStart(end)+switchmean;
            if tmp < N_samples
                %if the end of the injection was before the end of the
                %file, then spoof an event at that sample
                ContactEnd(ii)=tmp;
            else
                %if not then the file was chopped so take the penultimate
                %one
                ContactEnd(ii)=PulseStart(end-1);
            end
        else
            %if the result is not empty then there was a final switch, but
            %as i didnt always code the stop the last event should have
            %been after the last event. thus one is artificially added
            %based on the mean tirgger latency
            ContactEnd(ii)=PulseStart(last_idx-1+start_idx)+switchmean;
        end
    end
    
else
    ContactEnd=PulseStart(ContactStops);
end

%get end of last injection

if isempty(InjectionStops)
    %if no contact stops were found - either it is missing from the file or
    %its from an older dataset then estimate the last one
    
    for ii=1:length(InjectionFirst)
        
        start_idx=find(PulseStart == InjectionFirst(ii));
        %approximate switching from first 5 switches with a 5% overshoot
        
        switchmean=fix(mean(diff(PulseStart(start_idx:start_idx+5))));
        switch_approx=ceil(1.05*switchmean);
        
        %find the first instance when the switching time is greater than the
        %threshold.
        last_idx=find(diff(PulseStart(start_idx:end)) > switch_approx,1);
        
        
        if isempty(last_idx)
            % if the result is empty then the signal was either cut short - so use the
            % penultimate switch as this represents that last completed
            % injection or it was the last switch in the file and it was ebfore i coded the stop pulses
            
            tmp=PulseStart(end)+switchmean;
            if tmp < N_samples
                %if the end of the injection was before the end of the
                %file, then spoof an event at that sample
                InjectionEnd(ii)=tmp;
            else
                %if not then the file was chopped so take the penultimate
                %one
                InjectionEnd(ii)=PulseStart(end-1);
            end
        else
            %if the result is not empty then there was a final switch, but
            %as i didnt always code the stop the last event should have
            %been after the last event. thus one is artificially added
            %based on the mean tirgger latency
            InjectionEnd(ii)=PulseStart(last_idx-1+start_idx)+switchmean;
        end
    end
    
else
    InjectionEnd=PulseStart(InjectionStops);
end


%% find data start from indicator channel

%initialise matricies (too large for now)
ContactCheckSwitches=nan(length(PulseStart),length(ContactFirst));
InjectionSwitches=nan(length(PulseStart),length(InjectionFirst));

%find the switching indicies for each contact check in the data and stick
%in the matrix
for ii=1:length(ContactFirst)
    srt_idx=find(PulseStart == ContactFirst(ii)); %start at index with first pulse
    end_idx=find(PulseStart < ContactEnd(ii),1,'last'); %last index before end
    
    
    tmp=PulseStart(srt_idx:end_idx);
    
    %stick in switch array
    ContactCheckSwitches(1:length(tmp),ii)=tmp;
end
%clear up matrix
ContactCheckSwitches(all(isnan(ContactCheckSwitches),2),:)=[];

% again for injections
for ii=1:length(InjectionFirst)
    srt_idx=find(PulseStart == InjectionFirst(ii)); %start at index with first pulse
    end_idx=find(PulseStart < InjectionEnd(ii),1,'last'); %last index before end
    
    tmp=PulseStart(srt_idx:end_idx);
    
    InjectionSwitches(1:length(tmp),ii)=tmp;
end
%clear up matrix
InjectionSwitches(all(isnan(InjectionSwitches),2),:)=[];


disp('Injection channels read just fine');

Out.InjectionSwitches =InjectionSwitches;
Out.ContactCheckSwitches =ContactCheckSwitches;
Out.InjectionFirst = InjectionFirst;
Out.InjectionLast=InjectionEnd;
Out.ContactFirst =ContactFirst;
Out.ContactLast=ContactEnd;





end

function PulseStart=ReadIndPin(chn,HDR)

%this subfunction reads the pules on the indicator pin channel - this is a
%hangover from when we didnt use the trigger channel and is only relevant
%for 2013 datasets. This also fixes broken switches due to the indicator
%pin going funny sometimes


disp('Loading Header File for Indicator Channel ONLY');

%get voltages from indicator channel only

HDRi=sopen(HDR.FileName,'r',chn,['OVERFLOWDETECTION:OFF']);

Fs=HDRi.SampleRate;

IndicatorPinData=sread(HDRi,inf,0);

   thres=2000;
    min_coef=0.75;
 
%% process the indicator pin data as sometimes it fucks up


%find where it goes negative and set it to the "baseline" value
databaseline=mean(IndicatorPinData(1:Fs));

IndicatorPinData(IndicatorPinData < databaseline) = databaseline;

    
    
    
    

%% find contact check start from indicator channel

% find peaks in indicator channel

%min width - pulse is 500 micro seconds, so look only for pulses close to
%this
minwidth = fix(min_coef*(500e-6*Fs)); %rounded to nearest sample

%find peaks by creating logical threshold array. then finding the rising
%and falling edges, checking the width is greater than the min width


AboveThres=IndicatorPinData > thres; %threshold indicator pin data

AboveThres=[ false; AboveThres; false]; % pad with zeros (for diff below)
%this is now a logical array of 0 1. pulses are found by finding when the
%times when the data is above the threshold.

ThresEdges= diff(AboveThres); %take diff of this data. this is now nearly all 0 except for 1 for rsing edge and -1 for falling

RisingEdges = find(ThresEdges ==1); % get rising edges

FallingEdges = find(ThresEdges ==-1); %get falling edges

Pulsewidth = FallingEdges - RisingEdges; % get width of pulses

GoodPulses = Pulsewidth >= minwidth; % good pulses are those which are greater than the minimum width

PulseStart = RisingEdges(GoodPulses); %start of good pulses only

%% this is cheating to unfuck the indicator pin channel


%find if there are any starts in the file - then find if there are any
%"gaps" in the pulses less than 10 times the average pulse width


disp('Indicator Pin is usually fucked so Im gonna fix it now');


% threshold of pulse width - close to 500 microseconds
maxwidth = fix(1.1*(1000e-6*Fs)); %rounded to nearest sample

%find the pulses which are close together
BelowThres = (diff(PulseStart) < maxwidth);

%use bwlabel to find connections in array
[S, NN]=bwlabel(BelowThres);

%initialse array of starting positions
InjectionStarts=[];

%initialise counters
InjCnt=1;

%for each connected pulse, find size and see if it is a injection or
%contact impedance start
for ii=1:NN
    
    %find the number samples with this code
    codetmp=find (S == ii);
    codesize=size(codetmp,1);
    
    
    switch codesize
        case 1 % injection start is 2 pulses so diff =1
            InjectionStarts(InjCnt)=codetmp(1);
            InjCnt=InjCnt+1;
     
    end
end

if ~isempty(InjectionStarts)
    InjectionFirst= InjectionStarts+2;
else
    InjectionFirst=1;
end


%find the "correct" length of the switch


%%
%find the gaps, append a pulse at the end then sort them

%find where the gap is bigger than the correct value
Sw_in=diff(PulseStart(InjectionFirst:end));
Sw_True=mode(Sw_in);

%find where the gaps are
Sw_corrected=ceil(Sw_in./Sw_True);
gaps= Sw_corrected > 1;
gapind= find(gaps ==1);


%plug the gaps! this is cheating but who cares/will ever look at this
for gg=1:length(gapind)

    pulses_missing=Sw_corrected(gapind(gg)) -1;
    
    new_pulse_vec=(1:pulses_missing)*Sw_True+PulseStart(InjectionFirst+gapind(gg)-1);
    
    PulseStart=[PulseStart; new_pulse_vec'];
end
PulseStart=sort(PulseStart);


%find too small pulses
Pulses_short= find(diff(PulseStart(InjectionFirst:end)) < fix(0.9*Sw_True) == 1);

%get rid of them!!!!!
PulseStart(Pulses_short+InjectionFirst)=[];










    










end

