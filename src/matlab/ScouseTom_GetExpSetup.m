function [ ExpSetup ] = ScouseTom_GetExpSetup(varargin )
%Sets up experiment on ScouseTom system - connects to Arduino and Current
%Source. Gets protocol amplitude etc. Creates File Structure and saves info
%for later
% ExpSetup is structure containing all protocol info -
% amplitude/freq/date/timings etc. This is stored in ExperimentalInfo.mat
% for future use

%

% Constructed by Jimmys own fair hand.


%% Default things unlikely to change often so no point asking user for inputs each time
ContactCheckInjectTime =500; %ms to collect data on each pair of electrodes during contact impedance check


%% inputs varagin

if ~isempty(varargin)
    inpts=varargin;
else
    inpts={};
end


%% ask user if they want to load exisiting matfile or create new one

load_flag=0;
newprot_flag=0;


loadresp='Load exisiting one please';
entreresp='Ill enter manually thanks';
titlestr='How to get ExpSetup?';
promptstr=sprintf('Do you want to load an existing .mat file with ExpSetup in it and then edit?\nOr enter manually, including the arguments you may or may not have passed to this function');

resp=questdlg(promptstr,titlestr,entreresp,loadresp,entreresp);

if isempty(resp)
    error('User didnt select an option!!!');
end


if strcmp(resp,loadresp) == 1
    disp('User chose to load existing mat file');
    load_flag=1; %run the loading bit then
else
    disp('User chose to enter settings manually');
    newprot_flag=1; %run prompt bit
end


%% load existing .mat file if asked

if load_flag
    
    %get the previous mat file
    [filename, pathname] = uigetfile('*.mat', 'Where is that ExpSetup then eh?');
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel on file load')
    else
        fname=fullfile(pathname, filename);
        disp(['User selected to load ' fname])
    end
    
    disp('Loading exisiting ExpSetup');
    
    %load file
    load(fname);
    
    %check if expsetup was actually loaded
    if exist('ExpSetup','var') ==0
        error('ExpSetup not loaded properly - did you point to correct file?');
    end
    
    %check if the ExpSetup loaded is OK
    [loadedok,ExpSetup]=ScouseTom_ValidateExpSetup(ExpSetup);
    if loadedok
        disp('Previous ExpSetup is ok');
    else %prompt user to fix it
        warning('The ExpSetup saved previously doesnt check out! WTF. Please fix it');
        newprot_flag=1;
    end
    
    %compare any called variables - this is a stupid way of doing it
    previous_vars={ ExpSetup.Amp, ExpSetup.Freq,ExpSetup.Elec_num, ExpSetup.MeasurementTime,ExpSetup.Repeats,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset,ExpSetup.StimulatorPulseWidth,ExpSetup.StimulatorVoltage,ExpSetup.StimulatorWiperSetting};
    
    warn_flag=0;
    if ~isempty(varargin)
        for i=1:length(varargin)
            
            %if there is a difference in inputs and what is stored, put the new
            %value in the variable array and prompt to confirm
            if previous_vars{i} ~= varargin{i}
                warn_flag=1;
                previous_vars{i}=varargin{i};
            end
            
        end
    end
    
    if warn_flag %warn user a difference has been noticed
        disp('Input variables dont match what was stored in the ExpSetup matfile!');
        disp('Will prompt to resolve conflicts');
    end
    
    inpts=previous_vars;
    
    
    
    % ask if user wants to change protocol
    yesresp='Yes please - new protocol please!';
    noresp='Keep the old one';
    titlestr='Want a new protocol?';
    promptstr=sprintf('Do you want to load a new protocol, previous one was %s',ExpSetup.ProtocolName);
    resp=questdlg(promptstr,titlestr,yesresp,noresp,yesresp);
    
    if isempty(resp)
        warning('User didnt select an option! Making them choose new one anyway');
        newprot_flag=1;
    end
    
    
    if strcmp(resp,yesresp) == 1
        disp('User chose to change protocol');
        newprot_flag=1; %ask for new protocol
    else
        disp('User chose to keep existing protocol');
        %run prompt bit
    end
    
    
end


%% prompt user for new stuff


%Define CS parameters and get protocol if necessary - this is also a bad
%way of doing this
[Amp, Freq, Protocol,ProtocolName,Elec_num, MeasurementTime,Repeats,StimulatorTriggerTime,StimulatorTriggerOffset,StimulatorPulseWidth,StimulatorVoltage] = ScouseTom_SettingsDialog(newprot_flag,inpts{:});

if ~newprot_flag % if we havent asked for new protocol then output from above line is empty - so replace it with expsetup THIS IS A KLUDGE
    Protocol=ExpSetup.Protocol;
    ProtocolName=ExpSetup.ProtocolName;
end

if exist('ExpSetup','var') ==1 %if we have an expsetup in workspace then clear it now as we want to start afresh
    
    Info=ExpSetup.Info; %but save the info - this is a kludge
    clear ExpSetup
end


ProtocolLength = size(Protocol,1);
Freq_num=size(Freq,1);
ProtocolTime=ProtocolLength*(MeasurementTime/1000); %time in seconds for one complete protocol
TotalTime=Repeats*ProtocolTime*Freq_num;

fprintf('Approx time for all repeats and frequencies is: %.1f\r',TotalTime)

%stick into a structure, there must be a better way of doing this

%settings to send
ExpSetup.Amp=Amp;
ExpSetup.Freq=Freq;
ExpSetup.Protocol=Protocol;
ExpSetup.Elec_num=Elec_num;
ExpSetup.ContactCheckInjectTime=ContactCheckInjectTime;
ExpSetup.MeasurementTime=MeasurementTime;
ExpSetup.StimulatorTriggerTime=StimulatorTriggerTime;
ExpSetup.StimulatorTriggerOffset=StimulatorTriggerOffset;
ExpSetup.StimulatorPulseWidth=StimulatorPulseWidth;
ExpSetup.Repeats=Repeats;

%info/reference
ExpSetup.Info.ProtocolLength=ProtocolLength;
ExpSetup.Info.ProtocolTime=ProtocolTime;
ExpSetup.Info.ProtocolName=ProtocolName;
ExpSetup.Info.TotalTime=TotalTime;
ExpSetup.Info.OriginalProtocol=Protocol;
ExpSetup.Info.StimulatorVoltage=StimulatorVoltage;
ExpSetup.Info.FreqNum=Freq_num;

%get Stimulator potentiometer wiper setting
ExpSetup=ScouseTom_ard_getwipersetting(ExpSetup);

% ExpSetup.Timestamps.Zchecks=[];
% ExpSetup.Timestamps.InjStarts=[];

if exist('Info','var')==1 %this doesnt exist if we have not loaded a new one, yet another kludge
    ExpSetup.Info=Info;
end


%% get extra info from user about what this data actually is
prompt={'Experiment Description - Electrode Type/recording site/etc.'};
dlgtitle='Give a little info about this experiment for the archiologists finding it in the future';

if isfield(ExpSetup,'Info') == 1
    
    if isfield(ExpSetup.Info,'Desc') ==1
        
        thingything={ExpSetup.Info.Desc};
    else
        thingything={''};
    end
    
else
    thingything={''};
end

a =inputdlg(prompt,dlgtitle,1,thingything);

if ~isempty(a)
    Desc=a{1};
else
    Desc='Data stuffs';
end

%add to big structure
ExpSetup.Info.Desc=Desc;

%get timestamp for file creation

ExpSetup.Info.TimeStamp=now;
ExpSetup.Info.DateStr=datestr(now);

tmpdesc=Desc(~isspace(Desc)); %rmove whitespace form desc string

abrvlen=10; %only use abreviated name

if length(tmpdesc) < abrvlen %use up to abrvlen
    abrvlen=length(tmpdesc);
end

timestr=datestr(now,'yy-mm-dd_HH-MM'); %timestamp it

defname=['ExpSetup_', tmpdesc(1:abrvlen),'_',timestr,'_'];

if load_flag
    defstr=fullfile(pathname,defname); %use previous path
else
    defstr=defname;
end

%% validate the expsetup

disp('Validating Settings');
[settingsgood,ExpSetup]=ScouseTom_ValidateExpSetup(ExpSetup);

if settingsgood
    disp('Validated ok! :)');
else
    error('Bad input settings, nothing saved as I dont think its sensible to save fucked inputs :)');
end

%% write debug string

%string corresponding to these settings - to allow for manual control over
%arduino serial monitor

ExpSetup.Info.DebugString=getdebugstring(ExpSetup);



%% write setup structure to .mat

[newf, newp] = uiputfile('*.mat', 'Where shall I save this ExpSetup?',defstr);
if isequal(newf,0) || isequal(newp,0)
    warning('WHOA! User Chose NOT to save this ExpSetup....')
    return
else
    newfname=fullfile(newp, newf);
    disp(['User selected ',newfname ])
end


%% save ExpSetup;

%add save original directoy - in case this gets moved about
ExpSetup.Info.dname=newp;
ExpSetup.Info.fname=newf;
save(newfname,'ExpSetup');

end

function [dbstring]=getdebugstring(ExpSetup)
% function to create the string sent to arduino for these settings
%useful for debuging in the Serial montior of Arduino or Termite
% Send command 'I' followed by 'A' followed by these lines

dbstring='';

dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.ProtocolLength)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Elec_num)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.FreqNum)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Repeats)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.MeasurementTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.ContactCheckInjectTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerOffset)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorPulseWidth)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorWiperSetting)];

for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Freq(nn))];
end
for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Amp(nn))];
end










end




