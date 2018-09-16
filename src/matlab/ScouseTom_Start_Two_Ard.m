function [ Ard1,Ard2, ExpSetup1, ExpSetup2 ] = ScouseTom_Start_Two_Ard( Ard1, Ard2, ExpSetup1, ExpSetup2, logfid1, matlog1, logfid2, NoPrompt)

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
N_prt = size(ExpSetup1.Protocol,1);
N_freq= size(ExpSetup1.Freq,1);
N_rep=ExpSetup1.Repeats;

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


% Start measurement and confirm
if exist('NoPrompt','var') ==0
    NoPrompt=0;
end

if ~NoPrompt
    %ask if user ready to start - gives them opportunity to start recordign
    yesresp='START!';
    noresp='Cancel :(';
    titlestr='Ready to go?';
    promptstr=sprintf('Ready to start? \nI hope the EEG system is recording now....');
    resp=questdlg(promptstr,titlestr,yesresp,noresp,yesresp);
    
    if isempty(resp) || (strcmp(resp,noresp) == 1)
        cancel everytjing is they close dialogue
        CancelInj(Ard1,logfid1,tstart,logfname,matfilename)
        warning('User hit cancel');
        return
    end
    
end

%%

tstart=tic;

%flush buffer
FlushSerialBuffer(Ard1,logfid1,tstart);

%start injection now
writelogPC(logfid1,tstart,'Starting Injection');
%start arduino going
fprintf(Ard1,'S');
fprintf(Ard2, 'S');
writelogArd(logfid1,tstart,'S');

pause(0.2); %this was necessary on PC upstairs but not on my one. Could have been delay from USB hub? or PC bit slower?

%arduino sends ok message to confirm you sent command and settings are ok
% [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard1);
% writelogArd(logfid,tstart,resp);
% 
% if (~cscommok) %stop if badness
%     warning('Didnt get message from Arduino....');
%     CancelInj(Ard1,logfid,tstart,logfname,matfilename)
%     return
% end
% 
% if strcmp(resp, CScommOKmsg) %we are ready to go!
%     disp('Everything is good to go darling...');
%     writelogPC(logfid,tstart,'Comm ok, everything ready to go');
%     
% else
%     
%     if strcmp(resp,CSsettingserrmsg) %stop if settings are not coo
%         warning('Settings error - try resending settings i guess ');
%     end
%     
%     if strcmp(resp,CScommerrmsg)
%         warning('Comm error to CS! And at the last moment too! :( ');
%     end
%     
%     CancelInj(Ard1,logfid,tstart,logfname,matfilename)
%     return
% end
% 
%% SINGLE FREQUENCY INJECTION

if (SingleFreqMode ==1);
    
    disp('Starting Single Frequency Inject Mode');
    fprintf('Injecting at %dHz and %duA, for %d repeats...',ExpSetup1.Freq(1),ExpSetup1.Amp(1),N_rep);
    fprintf('This should take about %.1f minutes\n',ExpSetup1.Info.TotalTime/60);
    
%     %if single freq mode then arduino sends a further OK message
%     
%     %arduino sends ok message to confirm you sent command and settings are ok
%     [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard1);
%     writelogArd(logfid,tstart,resp);
%     
%     if (~cscommok)
%         warning('Didnt get message from Arduino....');
%         CancelInj(Ard1,logfid,tstart,logfname,matfilename)
%         if strcmp(resp,CScommerrmsg)
%             warning('Comm error to CS! And at the last moment too! :( ');
%         end
%         if strcmp(resp,CSsettingserrmsg)
%             warning('Settings were bad');
%         end
%         
%         return
%     end
%     
%     if strcmp(resp, CScommOKmsg)
%         disp('Stand back. Im going to try science');
%         disp('EIT IS STARTING...');
%         writelogPC(logfid,tstart,'EIT STARTING');
%     end
% else
%     disp('Starting Multi Frequency Inject Mode!');
%     fprintf('This should take about %.1f minutes\n',ExpSetup1.Info.TotalTime/60);
 end

%% Main Loop
% create box for stopping early
FS = stoploop('Injection is happening as we speak. Hit button to stop it early if you want...');

while(~FS.Stop() &&  ~Finished)
    elapsedtime=toc(tstart);
    
    if (Ard1.BytesAvailable > 0)
        inbyte=fread(Ard1,1,'uchar');
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
        
        writelogArd(logfid1,tstart,outstr);
        
        switch cmd
            case -1 % there has been an error - stop the recording
                
                %if a bad error has occured then stop, otherwise just
                %record it
                if (dataout ==1)
                    
                    HaltInj(Ard1,logfid1,tstart);
                    HaltInj(Ard2,logfid2,tstart);
                    Finished=1;
                    warning('Ard sent an error - stopping :(');
                    
                else
                    fprintf(2,'Arduino sent a non-critical error code: %s\n',outstr');
                end
                
                writelogPC(logfid1,tstart,'ERROR');
            case 0 %com ok msg sent
                disp('Ard sent an ok message that it shouldnt have done....erm');
            case 1 % inj finished! yay!
                disp('Ard is all done!');
                writelogPC(logfid1,tstart,'Finished! :)');
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
                    matlog1.FreqOrder(CurrentRep,CurrentPrt)={FreqOrder}; % stick in matlog file too
                    
                    if ~(SingleFreqMode) % reset phase counter as freq order sequence is complete
                        CurrentPhase=0;
                    end
                catch err
                    writelogArd(logfid1,tstart,'Failed Processing FreqOrder');
                    fprintf(2, '%s\n', getReport(err, 'extended'));
                end
                
                
            case 5 %new phase delay order
                try
                    CurrentPhase=CurrentPhase+1;
                    PhaseOrder=dataout;
                    if (SingleFreqMode) % much easier if single freq mode
                        matlog1.PhaseOrder(CurrentPhase,1:length(PhaseOrder))=PhaseOrder; % stick in matlog file too
                    else % different freqs might have different number of potential phases so must be stored in cell
                        matlog1.PhaseOrder(CurrentRep,CurrentPrt,CurrentPhase)={PhaseOrder};
                    end
                    
                catch err
                    writelogArd(logfid1,tstart,'Failed Processing Phase');
                    fprintf(2, '%s\n', getReport(err, 'extended'));
                end
                
                
                
            case 6 % Compliance Warning
                
                try
                    
                    [CompBad,CompBadArray]=ScouseTom_ard_complianceprocess(outstr,N_prt);
                    BadElecs=ScouseTom_ard_compestimatebadelec(CompBadArray,ExpSetup1.Protocol);
                    
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
                    writelogArd(logfid1,tstart,'Failed Processing Compliance');
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
    
    HaltInj(Ard1,logfid1,tstart);
    HaltInj(Ard2,logfid2,tstart);
    disp('User hit stop early! ermergerd!');
    writelogPC(logfid1,tstart,'User Stopped early');
    
    
end


FS.Clear(); %get rid of the loop button

HaltInj(Ard1,logfid1,tstart); %stop injection again just in case
HaltInj(Ard1,logfid1,tstart);


FlushSerialBuffer(Ard1,logfid1,tstart); % flush the serial buffer


disp('The injection was complete!');
writelogPC(logfid1,tstart,'Injection Finished!');


fclose(logfid1);
fclose(logfid2);

%all done!

 end

function CancelInj(Ard,logfid,tstart,fname,matname)
%cancel injection - this halts injection and deletes the empty log files

HaltInj(Ard,logfid,tstart);

fclose(logfid);
delete(fname);

delete(matname);

end

% 
% 
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

