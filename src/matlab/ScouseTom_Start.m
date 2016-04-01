function [ Ard,ExpSetup ] = ScouseTom_Start( Ard,ExpSetup,NoPrompt)
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

%% responses from arduino
Error_prefix='!';
Message_prefix='+';

Repeat_prefix='R';
Prt_prefix='P';
Freqord_prefix='F';
Phaseord_prefix='D';

CScommerrmsg='!E';
CSsettingserrmsg='!S';
CScommOKmsg='+OK';
CSfinishmsg='+Fin';

SwitchPowerErr='!Wp';
SwitchOpenErr='!Ws';

SwitchOKmsg='+SW';

%characters srrounding number
startchar='<';
endchar='>';
%% get some info about injection
N_prt = size(ExpSetup.Protocol,1);
N_freq= size(ExpSetup.Freq,1);
N_rep=ExpSetup.Repeats;

if N_freq >1
    SingleFreqMode=0;
else
    SingleFreqMode=1;
end

%% stuff for loop
CurrentRep=0;
CurrentPrt=0;
FreqOrder=ones(1,N_freq);
PhaseOrder=1;
CurrentPhase=0;

inbyte='X'; %set to this as empty string confuses ~=
instr='';
Finished=0; %flag for injection finished - set to 1 when ard sends CSfinishmsg

%% file name defaults
logstrdef='Testing';
eegnamedef='Null- user was testing';
logpathdef=pwd;


%% Prompt check


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

%open log file and make header
logfid=fopen(logfname,'w+');
writelogheader(logfid,ExpSetup,eegfname);

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

%% start by flushing serial buffer

% start timer
tstart=tic;

%flush buffer
FlushSerialBuffer(Ard,logfid,tstart);

%% Start measurement and confirm

if ~NoPrompt
    % ask if user ready to start - gives them opportunity to start recordign
    yesresp='START!';
    noresp='Cancel :(';
    titlestr='Ready to go?';
    promptstr=sprintf('Ready to start? \nI hope the EEG system is recording now....');
    resp=questdlg(promptstr,titlestr,yesresp,noresp,yesresp);
    
    if isempty(resp) || (strcmp(resp,noresp) == 1)
        %cancel everytjing is they close dialogue
        CancelInj(Ard,logfid,tstart,logfname,matfilename)
        warning('User hit cancel');
        return
    end
    
end

%start injection now
writelogPC(logfid,tstart,'Starting Injection');
%start arduino going
fprintf(Ard,'S');
writelogArd(logfid,tstart,'S');

pause(0.2); %this was necessary on PC upstairs but not on my one. Could have been delay from USB hub? or PC bit slower?

%arduino sends ok message to confirm you sent command and settings are ok
[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
writelogArd(logfid,tstart,resp);

if (~cscommok) %stop if badness
    warning('Didnt get message from Arduino....');
    CancelInj(Ard,logfid,tstart,logfname,matfilename)
    return
end

if strcmp(resp, CScommOKmsg) %we are ready to go!
    disp('Everything is good to go darling...');
    writelogPC(logfid,tstart,'Comm ok, everything ready to go');
    
else
    
    if strcmp(resp,CSsettingserrmsg) %stop if settings are not coo
        warning('Settings error - try resending settings i guess ');
    end
    
    if strcmp(resp,CScommerrmsg)
        warning('Comm error to CS! And at the last moment too! :( ');
    end
    
    CancelInj(Ard,logfid,tstart,logfname,matfilename)
    return
end

%% SINGLE FREQUENCY INJECTION

if (SingleFreqMode ==1);
    
    disp('Starting Single Frequency Inject Mode');
    fprintf('Injecting at %dHz and %duA, for %d repeats...',ExpSetup.Freq(1),ExpSetup.Amp(1),N_rep);
    fprintf('This should take about %.1f minutes\n',ExpSetup.Info.TotalTime/60);
    
    %if single freq mode then arduino sends a further OK message
    
    %arduino sends ok message to confirm you sent command and settings are ok
    [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
    writelogArd(logfid,tstart,resp);
    
    if (~cscommok)
        warning('Didnt get message from Arduino....');
        CancelInj(Ard,logfid,tstart,logfname,matfilename)
        if strcmp(resp,CScommerrmsg)
            warning('Comm error to CS! And at the last moment too! :( ');
        end
        if strcmp(resp,CSsettingserrmsg)
            warning('Settings were bad');
        end
        
        return
    end
    
    if strcmp(resp, CScommOKmsg)
        disp('Stand back. Im going to try science');
        disp('EIT IS STARTING...');
        writelogPC(logfid,tstart,'EIT STARTING');
    end
else
    disp('Starting Multi Frequency Inject Mode!');
    fprintf('This should take about %.1f minutes\n',ExpSetup.Info.TotalTime/60);
end

%% Main Loop
% create box for stopping early
FS = stoploop('Injection is happening as we speak. Hit button to stop it early if you want...');

while(~FS.Stop() &&  ~Finished)
    elapsedtime=toc(tstart);
    
    if (Ard.BytesAvailable > 0)
        inbyte=fread(Ard,1,'uchar');
        %concat string
        instr=[instr inbyte];
    end
    
    if (inbyte == endchar) % if complete resp has been sent
        
        %disp(['string in was: ', instr]);
        
        try
            [cmd,dataout,outstr]=ScouseTom_ard_parseinput(instr); %read the data from the input string
            
        catch err
            outstr=['Error parsing: ' instr];
            cmd=99;
            fprintf(2, '%s\n', getReport(err, 'extended'));
            
        end
        
        writelogArd(logfid,tstart,outstr);
        
        switch cmd
            case -1 % there has been an error - stop the recording
                
                %if a bad error has occured then stop, otherwise just
                %record it
                if (dataout ==1)
                    
                    HaltInj(Ard,logfid,tstart);
                    Finished=1;
                    warning('Ard sent an error - stopping :(');
                    
                else
                    fprintf(2,'Arduino sent a non-critical error code: %s\n',outstr');
                end
                
                writelogPC(logfid,tstart,'ERROR');
            case 0 %com ok msg sent
                disp('Ard sent an ok message that it shouldnt have done....erm');
            case 1 % inj finished! yay!
                disp('Ard is all done!');
                writelogPC(logfid,tstart,'Finished! :)');
                Finished=1;
            case 2 %new repeat - update display and log
                if dataout ~= CurrentRep
                    CurrentRep=dataout;
                    fprintf('%.2fs >>> Starting Repeat No. : %d of %d\n',elapsedtime,CurrentRep,N_rep);
                end
                
            case 3 %new protline
                CurrentPrt=dataout;
                fprintf('%.2fs >>> Starting Protocol Line: %d of %d for repeat %d of %d\n',elapsedtime,CurrentPrt,N_prt,CurrentRep,N_rep);
            case 4 % new freq order
                
                try
                    FreqOrder=dataout;
                    %disp(FreqOrder);
                    %tmp(1,1,1:N_freq)=FreqOrder; %kludge to ensure it is 3d
                    matlog.FreqOrder(CurrentRep,CurrentPrt)={FreqOrder}; % stick in matlog file too
                    
                    if ~(SingleFreqMode) % reset phase counter as freq order sequence is complete
                        CurrentPhase=0;
                    end
                catch err
                    writelogArd(logfid,tstart,'Failed Processing FreqOrder');
                    fprintf(2, '%s\n', getReport(err, 'extended'));
                end
                
                
            case 5 %new phase delay order
                try
                    CurrentPhase=CurrentPhase+1;
                    PhaseOrder=dataout;
                    if (SingleFreqMode) % much easier if single freq mode
                        matlog.PhaseOrder(CurrentPhase,1:length(PhaseOrder))=PhaseOrder; % stick in matlog file too
                    else % different freqs might have different number of potential phases so must be stored in cell
                        matlog.PhaseOrder(CurrentRep,CurrentPrt,CurrentPhase)={PhaseOrder};
                    end
                    
                catch err
                    writelogArd(logfid,tstart,'Failed Processing Phase');
                    fprintf(2, '%s\n', getReport(err, 'extended'));
                end
                
                
                
            case 6 % Compliance Warning
                
                try
                    
                    [CompBad,CompBadArray]=ScouseTom_ard_complianceprocess(outstr,N_prt);
                    BadElecs=ScouseTom_ard_compestimatebadelec(CompBadArray,ExpSetup.Protocol);
                    
                    fprintf('COMP OUT OF RANGE on %d of %d prot. lines! ',CompBad,N_prt);
                    
                    if ~isempty(BadElecs) % tell user to check electrodes if some are clearly bad
                        fprintf('Check elecs: ');
                        if length(BadElecs) >1
                            
                            for iprint=1:length(BadElecs)
                                fprintf('%d, ',BadElecs(iprint));
                            end
                            fprintf('%d \n',BadElecs(end));
                            
                        else
                            fprintf('%d \n',BadElecs);
                        end
                    else
                        fprintf('?\n'); %terminate string even if no bad ones found
                    end
                    
                catch err
                    writelogArd(logfid,tstart,'Failed Processing Compliance');
                    fprintf(2, '%s\n', getReport(err, 'extended'));
                end
                
            otherwise
                fprintf('Broken input from Ard');
                
        end
        
        %reset instring and in byte now one completed
        instr='';
        inbyte='X';
    end
    
end

if FS.Stop() %if user hit the stop button
    
    HaltInj(Ard,logfid,tstart);
    disp('User hit stop early! ermergerd!');
    writelogPC(logfid,tstart,'User Stopped early');
    
    
end


FS.Clear(); %get rid of the loop button

HaltInj(Ard,logfid,tstart); %stop injection again just in case


FlushSerialBuffer(Ard,logfid,tstart); % flush the serial buffer


disp('The injection was complete!');
writelogPC(logfid,tstart,'Injection Finished!');


fclose(logfid);

%all done!

end

function CancelInj(Ard,logfid,tstart,fname,matname)
%cancel injection - this halts injection and deletes the empty log files

HaltInj(Ard,logfid,tstart);

fclose(logfid);
delete(fname);

delete(matname);

end



function HaltInj(Ard,logfid,tstart)
%halt the injection
fprintf(Ard,'H');
writelogPC(logfid,tstart,'H');
end


function FlushSerialBuffer(Ard,logfid,tstart)
%remove anything in the serial buffer - otherwise matters are super
%confused

% disp('Flushing Serial Buffer...');


while (Ard.BytesAvailable >0) %whilst there are bytes to read
    
    jnk=fread(Ard,Ard.BytesAvailable,'uchar'); %read as much as possible from buffer
    jnkstr=sprintf(char(jnk)); %convert to string
    jnkstr=strrep(jnkstr,sprintf('\r\n'),''); %remove newlines
    fprintf(logfid,'%.2fs\t\tSerial Buffer flushed: %s\n',toc(tstart),jnkstr); %write to log
    pause(0.2); %wait a bit to fill up Serial buffer is necessary - not needed on my PC but added in case related problems to the pause needed at the start
    
end

end


function writelogPC(logfileid,ticstart,usermsg)
%writes to log file either commands sent from PC or description of events

% format is Seconds ArduinoRec PCSend, tab delim, so this goes in third
% column
fprintf(logfileid,'%.2fs\t\t%s\n',toc(ticstart),usermsg);

end

function writelogArd(logfileid,ticstart,Ardchar)
%writes to log file either commands sent from PC or description of events

% format is Seconds ArduinoRec PCSend, tab delim, so this goes in second
% column

%first make sure its a string
if ~ischar(Ardchar)
    Ardstr=sprintf(char(Ardchar));
else
    Ardstr=Ardchar;
end

%then remove any newlines incase Serial.println was used by msitake
Ardstr=strrep(Ardstr,sprintf('\r\n'),'');

%write to second column in log
fprintf(logfileid,'%.2fs\t%s\t\n',toc(ticstart),Ardstr);

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




