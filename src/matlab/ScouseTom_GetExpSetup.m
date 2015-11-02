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
ComplianceDefault=1900; %Compliance of current source in mV

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
    previous_vars={ ExpSetup.Amp, ExpSetup.Freq,ExpSetup.Elec_num, ExpSetup.MeasurementTime,ExpSetup.Repeats,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset,ExpSetup.StimulatorPulseWidth,ExpSetup.StimulatorVoltage,ExpSetup.Info.Inj_Cycles,ExpSetup.Info.Inj_Cycles_Offset};
    
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
    promptstr=sprintf('Do you want to load a new protocol, previous one was %s',ExpSetup.Info.ProtocolName);
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


% ask if they want to define it by measurement time or number of cycles
  % ask if user wants to change protocol
    msresp='Number of ms';
    cycresp='Number of cycles';
    titlestr='Define injection length';
    promptstr=('How to do want to define the injection time? Milliseconds or number of cycles?');
    resp=questdlg(promptstr,titlestr,msresp,cycresp,msresp);
    
    if isempty(resp)
        warning('User hit cancel, doing milliseconds');
        define_ms_flag=1;
    end
    
    
    if strcmp(resp,msresp) == 1
        disp('User selected define injections by ms');
        define_ms_flag=1; %ask for new protocol
    else
        disp('User selected define injections by cycles');
        %run prompt bit
        define_ms_flag=0;
    end





%Define CS parameters and get protocol if necessary - this is also a bad
%way of doing this
[Amp, Freq, Protocol,ProtocolName,Elec_num, MeasurementTime,Repeats,StimulatorTriggerTime,StimulatorTriggerOffset,StimulatorPulseWidth,StimulatorVoltage,Cycles,Offset] = ScouseTom_SettingsDialog(newprot_flag,define_ms_flag,inpts{:});

if ~newprot_flag % if we havent asked for new protocol then output from above line is empty - so replace it with expsetup THIS IS A KLUDGE
    Protocol=ExpSetup.Protocol;
    ProtocolName=ExpSetup.Info.ProtocolName;
end

if exist('ExpSetup','var') ==1 %if we have an expsetup in workspace then clear it now as we want to start afresh
    
    Info=ExpSetup.Info; %but save the info - this is a kludge
    clear ExpSetup
end


ProtocolLength = size(Protocol,1);
Freq_num=size(Freq,1);
ProtocolTime=sum(ProtocolLength*(MeasurementTime/1000)); %time in seconds for one complete protocol
TotalTime=Repeats*ProtocolTime;

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
ExpSetup.StimulatorVoltage=StimulatorVoltage;
ExpSetup.Repeats=Repeats;
ExpSetup.Bad_Elec=[];
ExpSetup.Compliace=ComplianceDefault;

%info/reference
ExpSetup.Info.ProtocolLength=ProtocolLength;
ExpSetup.Info.ProtocolTime=ProtocolTime;
ExpSetup.Info.ProtocolName=ProtocolName;
ExpSetup.Info.TotalTime=TotalTime;
ExpSetup.Info.OriginalProtocol=Protocol;
ExpSetup.Info.FreqNum=Freq_num;
ExpSetup.Info.Inj_Cycles=Cycles;
ExpSetup.Info.Inj_Cycles_Offset=Offset;
ExpSetup.Info.Inj_Define_ms=define_ms_flag;

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

tmpdesc=Desc(isstrprop(Desc,'alphanum')); %only take alpha numerica characters

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




