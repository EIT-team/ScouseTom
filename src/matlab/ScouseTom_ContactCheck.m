function [Ard] = ScouseTom_ContactCheck( Ard,ExpSetup )
%SCOUSETOM_CHECKCOMPLIANCE Summary of this function goes here
%   Detailed explanation goes here

%% info from expsetup

N_prt=ExpSetup.Info.ProtocolLength;

N_elec=ExpSetup.Elec_num;

Contact_Protocol=[1:N_elec; circshift(1:N_elec,-1,2)]';
Contact_Protocol=Contact_Protocol(~(any(ismember(Contact_Protocol,ExpSetup.Bad_Elec),2)),:);




%% Possible inputs

%this must be the same as the Errors.h

%expected stuff:

Error_prefix='!';
Message_prefix='+';

Repeat_prefix='R';
Prt_prefix='P';
Freqord_prefix='O';
Phaseord_prefix='D';
Compliance_prefix='C';

CScommerrmsg='!E';
CSsettingserrmsg='!S';
CSpmarkerrmsg = '!P';
SwitchPWRerrmsg = '!Wp';
SwitchOpenerrmsg = '!Ws';
CScomplianceerrmsg = '!C';


CScommOKmsg='+OK';
CSfinishmsg='+Fin';
SwitchOKmsg = '+SW';
ComplianceOKmsg = '+C';

%characters srrounding number
startchar='<';
endchar='>';
%% Send command

FlushSerialBuffer(Ard);


% ask if user ready to start - gives them opportunity to start recordign
yesresp='START!';
noresp='Cancel :(';
titlestr='Ready to go?';
promptstr=sprintf('Ready to start? \nI hope the EEG system is recording now....');
resp=questdlg(promptstr,titlestr,yesresp,noresp,yesresp);

if isempty(resp) || (strcmp(resp,noresp) == 1)
    %cancel everytjing is they close dialogue
    
    warning('User hit cancel');
    return
end



%% Send Start Contact Command
disp('Checking Contact - Neighbouring Electrode injections');
fprintf(Ard,'C');

%% Get starting info

%ard sends CSOK message at start if Settings and CS ok

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get message from Arduino....');
    HaltInj(Ard);
    return
end

if strcmp(resp,CScommOKmsg)
    %     disp('Starting Contact Check');
else
     if strcmp(resp,CSsettingserrmsg)
         warning('Settings error - did you send them to Arduino yet!?');
     end
    disp('Arduino not ready to start - do you send the settings OK? Check current source');
    HaltInj(Ard);
    return;
end

%then sends settings and says OK if successful

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get message from Arduino....');
    HaltInj(Ard);
    return
end

if strcmp(resp,CScommOKmsg)
    %     disp('Settings sent OK');
else
    disp('CS Problem :(');
    HaltInj(Ard);
    return;
end

%% Main loop - we dont know beforehand how long to wait for resp

Finished=0; %flag for injection finished - set to 1 when ard sends CSfinishmsg
inbyte='X'; %set to this as empty string confuses ~=
instr='';


disp('INJECTING CONTACT CHECK PROTOCOL...');

% create box for stopping early
FS = stoploop('Contact Check is happening! Hit button to stop it early if you want...');

while(~FS.Stop() &&  ~Finished)
    
    if (Ard.BytesAvailable > 0)
        inbyte=fread(Ard,1,'uchar');
        %concat string
        instr=[instr inbyte];
    end
    
    if (inbyte == endchar) % if complete resp has been sent
        
        %disp(['string in was: ', instr]);
        
        try
            [cmd,dataout,outstr]=ScouseTom_ard_parseinput(instr); %read the data from the input string
            
        catch
            outstr=['Error parsing: ' instr];
            cmd=99;
            
        end
        
        switch cmd
            case -1 % there has been an error - stop the recording
                
                if (dataout ==1)
                    
                    HaltInj(Ard);
                    Finished=1;
                    warning('Ard sent an error - stopping :(');
                    
                    
                else
                    warning('Arduino sent a non-critical error code');
                    
                end
                
                
            case 6 % Compliance Warning
                
                
                try
                    
                    [CompBad,CompBadArray]=ScouseTom_ard_complianceprocess(outstr,N_prt);
                    BadElecs=ScouseTom_ard_compestimatebadelec(CompBadArray,Contact_Protocol);
                    
                    fprintf('WTF! COMPLIANCE OUT OF RANGE on %d of %d prot. lines! ',CompBad,N_prt);
                    
                    if ~isempty(BadElecs) % tell user to check electrodes if some are clearly bad
                        fprintf('Check electrodes: ');
                        if length(BadElecs) >1
                            
                            for iprint=1:length(BadElecs)
                                fprintf('%d, ',BadElecs(iprint));
                            end
                            fprintf('%d \n',BadElecs(end));
                            
                        else
                            fprintf('%d \n',BadElecs);
                        end
                    end
                    
                catch
                    warning('Error during Compliance processing');
                end
                
                
                
            case 1  % inj finished! yay!
                disp('Ard is all done!');
                Finished=1;
        end
        
        %reset instring and in byte now one completed
        instr='';
        inbyte='X';
    end
    
end

if FS.Stop() %if user hit the stop button
    HaltInj(Ard);
    disp('User hit stop early! ermergerd!');
    
end
FS.Clear(); %get rid of the loop button

FlushSerialBuffer(Ard); % flush the serial buffer


%% Process the results of the compliance check

end


function HaltInj(Ard)
%halt the injection
fprintf(Ard,'H');
end



function FlushSerialBuffer(Ard)
%remove anything in the serial buffer - otherwise matters are super
%confused


while (Ard.BytesAvailable >0) %whilst there are bytes to read
    
    jnk=fread(Ard,Ard.BytesAvailable,'uchar'); %read as much as possible from buffer
    %     jnkstr=sprintf(char(jnk)); %convert to string
    %     jnkstr=strrep(jnkstr,sprintf('\r\n'),''); %remove newlines
    %     fprintf(logfid,'%.2fs\t\tSerial Buffer flushed: %s\n',toc(tstart),jnkstr); %write to log
    pause(0.2); %wait a bit to fill up Serial buffer is necessary - not needed on my PC but added in case related problems to the pause needed at the start
    
end

end