function [ Ard,ExpSetup, logfid, matlog ] = ScouseTom_StartFile_d( Ard,ExpSetup, prt_n,NoPrompt)
%ScouseTom_Start Start injection with scoustom system
%
%   Script to start injection on the ScouseTom system. User must have run
%   ScouseTom_init to get Ard object (only once), and sent the ExpSetup to
%   the arduino using ScouseTom_SendSettings.
%
%   User is asked for location of the corresponding EEG system file (bdf or
%   eeg depending on whether biosemi or actichamp used) to save the log
%   file and mat. All responses and commands to and from arduino is saved
%   to ##EEGfilename###_log.txt. ExpSetup along with the FreqOrder and
%   PhaseOrder cell arrays if multiinject or stimulation used.
%
%   Inputs : Ard - Arduino object
%           ExpSetup - Structure for setup
%
%   Outputs : as above
%
% hewn from the finest marble by the exploratory hands of jimmy 2015

%% get some info about injection
N_prt = size(ExpSetup.Protocol,1);
N_freq= size(ExpSetup.Freq,1);
N_rep=ExpSetup.Repeats;

if N_freq >1
    SingleFreqMode=0;
else
    SingleFreqMode=1;
end

%% file name defaults
logstrdef='Testing';
eegnamedef='Null- user was testing';
logpathdef=pwd;


%% Prompt check

% 
if exist('NoPrompt','var') ==0
    NoPrompt=0;
end

%% prompt user to point at eeg/bdf file that they are saving

RecordingData=0; %should we look for a file?

if ~NoPrompt
    % ask if user wants to change protocol
    yesresp='YES, it is, honest';
    noresp='NO! Im testing leave me alone';
    titlestr='Where is your eeg data being saved?';
    promptstr=sprintf('EEG SYSTEM SHOULD BE READY TO SAVE NOW - FOR REALS\n You will have to point to the file');
    resp=questdlg(promptstr,titlestr,yesresp,noresp,yesresp);
    
    if isempty(resp) %if user quits dialogue then save in default
        warning('User didnt say if testing, taking this to mean they ARE testing and dont want to save');
        RecordingData=0;
    end
    
    
    if strcmp(resp,yesresp) == 1
        %     disp('User is ready to record - will need confirmation');
        RecordingData=1;
    else
        %     disp('User is testing, will save log in working directory instead');
        %might want to set so that it doesnt save at all...
    end
    
end

if RecordingData % if we are saving then look for the eeg file to save everything
    
    %get the previous mat file
    [eegfilename, eegpathname] = uigetfile({'*.bdf;*.eeg','EEG files';'*.*','All files'}, 'Which BioSemi or Actiview file does this belong too?');
    if isequal(eegfilename,0) || isequal(eegpathname,0)
        warning('User pressed cancel on file load - ASSUMING TESTING')
        logpath=logpathdef; %this will likely annoy people by clogging everything up
        logstr=logstrdef;
        eegfname=eegnamedef;
        RecordingData=0;
    else
        eegfname=fullfile(eegpathname, eegfilename);
        disp(['User selected ' eegfname ' as corresponding EEG file'])
        logpath=eegpathname;
        % logname=sprintf('%s_log.txt',ExpSetup.Info.fname);
        [~, logstr]=fileparts(eegfilename);
    end
    
else %set some defaults
    eegfname=eegnamedef;
    logstr=logstrdef;
    logpath=logpathdef;
    
end

%% create log file for this injection
log_suffix='_log.txt';
logfname=fullfile(logpath,[logstr log_suffix]);

if RecordingData % increment log file name for non testing ones only
    
    if (exist(logfname,'file') ==2) %incrememnt it incase one already exisits - you might inject a bunch of times and use the same EEG file
        incr=1;
        while exist(logfname,'file') ==2
            incr=incr+1;
            log_suffix=sprintf('_log_%d.txt',incr);
            logfname=fullfile(logpath,[logstr log_suffix]);
        end
    end
else
    %if not recording data then DELETE the testing log before making new
    %one
    if exist(logfname,'file') ==2
        delete(logfname);
    end
end


log_path = 'D:\Mayo';
logstr=['prt' num2str(prt_n)];
log_suffix=[num2str(prt_n) 'd_log.txt'];
logfname=fullfile(logpath,[logstr log_suffix]);

%open log file and make header
logfid=fopen(logfname,'w+');
writelogheader(logfid,ExpSetup,eegfname);
RecordingData = 1;

%% create matlab file for it too

%create mat file with same name as the logfile
[matlogpath,matlogname]=fileparts(fullfile(logpath,[logstr log_suffix]));

%create matfile object - so data is saved as we go rather than at the end
%to limit data loss in the case of matlab crashing

matfilename=fullfile(matlogpath,[matlogname '.mat']);

%delete the existing Testing_log.mat as it does not behave well when
%charging variable sizes - if you changed from

if ~RecordingData
    if exist(matfilename,'file') ==2
        delete(matfilename);
    end
end

matlog=matfile(matfilename,'Writable',true);

matlog.ExpSetup=ExpSetup;
matlog.date=datestr(clock);

if SingleFreqMode % there are some specific things needed for MultiFreqMode
    
else % different freqs might have different number of potential phases so must be stored in cell
    matlog.FreqOrder=cell(N_rep,N_prt);
    matlog.PhaseOrder=cell(N_rep,N_prt,N_freq);
end
end


function writelogheader(logfid,ExpSetup,eegname)
% write the header for the log file - basically from ValidateExpSetup

N_prt = size(ExpSetup.Protocol,1);
N_freq= size(ExpSetup.Freq,1);
N_amp= size(ExpSetup.Amp,1);
N_rep=ExpSetup.Repeats;

if N_freq >1
    SingleFreqMode=0;
else
    SingleFreqMode=1;
end

if (ExpSetup.StimulatorPulseWidth ==0 || ExpSetup.StimulatorTriggerOffset ==0 || ExpSetup.StimulatorTriggerTime ==0)
    StimMode=0;
else
    StimMode=1;
end
fprintf(logfid,'##################################\n');
fprintf(logfid,'Log file for EIT with ScouseTom system\n');
fprintf(logfid,'Date and time this file was created : %s\n',datestr(clock));
fprintf(logfid,'Description of this ExpSetup file : %s\n',ExpSetup.Info.Desc');
fprintf(logfid,'ExpSetup created : %s\n',ExpSetup.Info.DateStr);
fprintf(logfid,'The EEG system file stored was : %s\n',eegname);
fprintf(logfid,'The PC name was : %s\n',getenv('COMPUTERNAME')); %only works on windows
fprintf(logfid,'The Username was : %s\n',getenv('USERNAME'));
fprintf(logfid,'--------------\n');

if SingleFreqMode %simpler output for singlefreqmode
    fprintf(logfid,'System in "SingleFreqMode" - single amp and freq, running continuously\n');
    fprintf(logfid,'Amplitude: %d uA\n',ExpSetup.Amp(1));
    fprintf(logfid,'Frequency: %d Hz\n',ExpSetup.Freq(1));
else %badly coded for multiinject
    fprintf(logfid,'System in "MultiFreqMode" - %d frequencies, randomised for each protocol line\n',N_freq);
    fprintf(logfid,'Amplitudes uA: ');
    %could probably use dlmwrite for below
    for i=1:N_amp-1
        fprintf(logfid,'%d, ',ExpSetup.Amp(i));
    end
    fprintf(logfid,'%d \n',ExpSetup.Amp(N_amp));
    fprintf(logfid,'Frequencies Hz: ');
    
    for i=1:N_amp-1
        fprintf(logfid,'%d, ',ExpSetup.Freq(i));
    end
    fprintf(logfid,'%d \n',ExpSetup.Freq(N_freq));
end

fprintf(logfid,'Protocol loaded was %s with %d lines \n',ExpSetup.Info.ProtocolName,N_prt);
fprintf(logfid,'Sources\tSinks\n');

for i =1:N_prt
    fprintf(logfid,'%d\t%d\n',ExpSetup.Protocol(i,1),ExpSetup.Protocol(i,2));
end
fprintf(logfid,'--------------\n');
fprintf(logfid,'Number of repeats : %d \n',ExpSetup.Repeats);

if SingleFreqMode
    fprintf(logfid,'Injection time per protocol line : %d ms or %.2f s\n',ExpSetup.MeasurementTime, ExpSetup.MeasurementTime/1000);
else
    for i=1:N_amp
        fprintf('Injection time for Freq %d: %d Hz: %d ms or %d cycles\n',i,ExpSetup.Freq(i),ExpSetup.MeasurementTime(i), ExpSetup.Info.Inj_Cycles(i));
    end
end

fprintf(logfid,'Estimated time to complete measurements :');

if ExpSetup.Info.TotalTime < 60
    fprintf(logfid,' %.2f sec \n',ExpSetup.Info.TotalTime);
else if ExpSetup.Info.TotalTime < 3600
        fprintf(logfid,' %.2f min \n',ExpSetup.Info.TotalTime/60);
    else
        fprintf(logfid,' %.2f hours \n',ExpSetup.Info.TotalTime/3600);
    end
end
fprintf(logfid,'--------------\n');

if StimMode
    fprintf(logfid,'Stimulation Mode is ON! - Randomised phase delay triggered by phase marker on Keithley\n');
    fprintf(logfid,'%d uS pulse triggered every %d ms with offset %d ms from channel switch\n',ExpSetup.StimulatorPulseWidth,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset);
    fprintf(logfid,'Approx %d stims per injection\n',floor((ExpSetup.MeasurementTime(1)-ExpSetup.StimulatorTriggerOffset)/ExpSetup.StimulatorTriggerTime));
    fprintf('Stimulation Voltage is %.2f V for a potentiomter setting of %d\n',ExpSetup.StimulatorVoltage,ExpSetup.Info.StimulatorWiperSetting);
end

fprintf(logfid,'##################################\n');
fprintf(logfid,'Codes for info from arduino: \n');
fprintf(logfid,'R\tCurrent Repeat\nP\tCurrent Protocol Line\nO\tfrequency order (multifreqmode)\nD\tphases (stim mode)\n');
fprintf(logfid,'Codes for commmands sent to arduino: \n');
fprintf(logfid,'S\tStart\nH\tStop\nI\tInitialise\n');

fprintf(logfid,'##\n');
fprintf(logfid,'Time\tArduino Message\tPC Message\n');
end







