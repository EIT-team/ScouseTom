function [ S,CurrentSource,ExpSetup ] = ScouseTom_Setup( ArduinoSerialPort,CurrentSourcePort,varargin )
%Sets up experiment on ScouseTom system - connects to Arduino and Current
%Source. Gets protocol amplitude etc. Creates File Structure and saves info
%for later
% ExpSetup is structure containing all protocol info -
% amplitude/freq/date/timings etc. This is stored in ExperimentalInfo.mat
% for future use

%  Sets up folder for the experimental data to be stored in.

% Constructed by Jimmys own fair hand. 


%% Default things unlikely to change often so no point asking user for inputs each time
IntervalDelay = 10;  %Amount of time to pause between changing amplitude and frequency
ContactCheckInjectTime =500; %ms to collect data on each pair of electrodes during contact impedance check

%% close ports if any already open

if ~isempty(instrfind)
    fclose(instrfind);
end

%% Prompt the user to point to Folder Location

%get root name of the folder
dname=uigetdir([],'Define the root folder for the data - Subfolders will be created if they dont already exist');

%name for exp info file
fname=fullfile(dname,'ExperimentInfo.mat');

%if the ExpSetup File exists load that instead

promptflag=0;

if exist(fname,'file') == 2
    disp('Experimental Info File Already Exists - Loading This Instead');
    
    %load file
    load(fname);
    
    %compare any called variables
    previous_vars=[ ExpSetup.Ampl, ExpSetup.Freq,ExpSetup.Elec_num, ExpSetup.MeasurementTime,ExpSetup.TotalTime,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset];
    
    if ~isempty(varargin)
        for i=length(varargin)
            
            %if there is a difference in inputs and what is stored, put the new
            %value in the variable array and prompt to confirm
            if previous_vars(i) ~= varargin{i}
                disp('Input variables dont match what was stored in the ExperimentInfo matfile');
                disp('Will prompt to resolve conflicts');
                promptflag=1;
                previous_vars(i)=varargin{i};
            end
            
        end
    end
    
    %change the protocol?
    disp('-----------------------------------');
    disp('This is the Protocol in the existing file');
    
    disp(ExpSetup.Protocol);
    
    
    %     f=figure;
    %     colnames={'Sources','Sinks'};
    %
    %     t=uitable(f,'Data',ExpSetup.Protocol,'ColumnName',colnames);
    
    
    ytxt='Yes Please! That old protocol is shit';
    ntxt='No Thanks! I love that old protocol';
    titlething='New Protocol?';
    qstring='This is the old protocol - CHANGE IT?';
    
    %ask it and that
    response=questdlg(qstring,titlething,ytxt,ntxt,ntxt);
    
    if strcmp(response,ytxt) ==1
        
        promptflag=1;
        
    end
else
    %if the file does not exist then prompt user for input etc.
    promptflag=1;
    if ~isempty(varargin)
    previous_vars=varargin{:};
    else
        previous_vars=[];
    end
end

% disp('thing');


if promptflag ==1
    
    %% get user input on experiment info
    
    %
    inpts=num2cell(previous_vars);
    

    %Define CS parameters and get protocol
    [Ampl, Freq, Protocol,Elec_num, MeasurementTime,TotalTime,StimulatorTriggerTime,StimulatorTriggerOffset] = ScouseTom_GetFreqAmpProtStim(inpts{:});
    ProtocolLength = size(Protocol,1);
    Max_elec=max(max(Protocol));
    
    if Max_elec > Elec_num
        if isequal(questdlg('Number of electrodes less than the max electrode addressed in protocol. You sure bro?','Weird Number of Electrodes','Woops! Cancel','Yes I am! Carry on.','Woops! Cancel'),'Woops! Cancel')
            error('User Canceled Operation');
        else
            disp('Carrying on with number of electrodes less than highest one addressed in protocol');
        end
    end
    
    %check measurement time is OK
    ProtocolTime=ProtocolLength*MeasurementTime/1000; %time in seconds for one complete protocol
    Prot_reps=TotalTime/ProtocolTime;
    
    fprintf('Approx number of complete protocols is: %.1f\r',Prot_reps)
    
    
    if Prot_reps <1
        if isequal(questdlg('Number of complete protocols is less than 1. You sure bro?','Weird Protocol Time','Woops! Cancel','Yes I am! Start','Woops! Cancel'),'Woops! Cancel')
            error('User Canceled Operation');
        else
            disp('Carrying on with only a bit of a repeat');
        end
    end
    %% stick into a structure, there must be a better way of doing this
    
    ExpSetup.Ampl=Ampl;
    ExpSetup.Freq=Freq;
    ExpSetup.Protocol=Protocol;
    ExpSetup.Elec_num=Elec_num;
    ExpSetup.MeasurementTime=MeasurementTime;
    ExpSetup.TotalTime=TotalTime;
    ExpSetup.StimulatorTriggerTime=StimulatorTriggerTime;
    ExpSetup.StimulatorTriggerOffset=StimulatorTriggerOffset;
    ExpSetup.ProtocolLength=ProtocolLength;
    ExpSetup.ProtocolTime=ProtocolTime;
    ExpSetup.Prot_reps=Prot_reps;
    ExpSetup.IntervalDelay=IntervalDelay;
    ExpSetup.ContactCheckInjectTime=ContactCheckInjectTime;
    
    ExpSetup.Timestamps.Zchecks=[];
    ExpSetup.Timestamps.InjStarts=[];
    
    %% define measurement folder for the files
    
    %make Zcheck and Data folders
    mkdir(dname,'Zcheck');
    mkdir(dname,'Data');
    
    %get extra info from users
    prompt={'Experiment Description - Electrode Type/recording site/etc.'};
    dlgtitle='Give a little info about this experiment for the archiologists finding it in the future';
    
    if isfield(ExpSetup,'Info') 
        if  isfield(ExpSetup.Info,'Desc')
            
        thingything={ExpSetup.Info.Desc};
        end
    else
        thingything={''};
    end
    
    a =inputdlg(prompt,dlgtitle,1,thingything);
    
    if ~isempty(a)
        Desc=a{1};
    else
        Desc='Some Data and stuffs';
    end
    
    %add to big structure
    ExpSetup.dname=dname;
    ExpSetup.Info.Desc=Desc;
    
    %get timestamp for file creation
    
    ExpSetup.Info.TimeStamp=now;
    ExpSetup.Info.DateStr=datestr(now);
    
    
    %% write setup structure to .mat
    
    fname=fullfile(dname,'ExperimentInfo.mat');
    
    
end


%% save ExpSetup;
save(fname,'ExpSetup');


%% connect to arduino and send experimental info

% in case the arduino communication was opened already
if exist('S','var')
    fclose(S);
    clear('S');
end


% Reset and Connect to Arduino
[S,combadness]=SetupArduinoSerial(ArduinoSerialPort);

% check if is all well
if combadness ~= 0
    error('Problem with arduino communication at some point');
    fclose(S);
    clear('S');
end


% Send Protocol info to Arduino
expbadness=SendArduinoExpSetupStim(S, ExpSetup.Protocol, ExpSetup.Elec_num, ExpSetup.MeasurementTime, ExpSetup.ContactCheckInjectTime, ExpSetup.StimulatorTriggerTime, ExpSetup.StimulatorTriggerOffset);

% check if is all well
if  expbadness ~= 0
    error('Problem with arduino communication at some point');
    fclose(S);
    clear('S');
end

%%
%Initialise Current Source
CurrentSource = ConnectToCS(CurrentSourcePort);

disp('Everything Connected OK - Ready to Inject');


end

