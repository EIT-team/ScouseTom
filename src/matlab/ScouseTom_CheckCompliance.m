function [ Ard,CompOK ] = ScouseTom_CheckCompliance( Ard,ExpSetup )
%SCOUSETOM_CHECKCOMPLIANCE Summary of this function goes here
%   Detailed explanation goes here

%% info from expsetup

N_prt=ExpSetup.Info.ProtocolLength;



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

disp('Checking Compliance - this is preflight check before recording');
fprintf(Ard,'L');

%% Get starting info

%ard sends Compok message at start

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get OK message from Arduino....');
    return
end
if strcmp(resp,ComplianceOKmsg)
    disp('Ard Starting Compliance Check');
else
    disp('Arduino not ready to start - do you send the settings OK? Check current source');
    CompOK=0;
    return;
end

%then it sends the number of compliances it will check

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (numflg && cscommok)
    NumComp=resp;
else
    CompOK=0;
    return;
end

%then number of frequencies
[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (numflg && cscommok)
    NumFreq=resp;
else
    CompOK=0;
    return;
end

%% Main loop - we dont know beforehand how long to wait for resp

Finished=0; %flag for injection finished - set to 1 when ard sends CSfinishmsg
inbyte='X'; %set to this as empty string confuses ~=
instr='';


CompBadAll=nan(NumComp,NumFreq);
CompBadArrayAll=cell(NumComp,NumFreq);




% create box for stopping early
FS = stoploop('Compliance Check is happening! Hit button to stop it early if you want...');

while(~FS.Stop() &&  ~Finished)
    
    if (Ard.BytesAvailable > 0)
        inbyte=fread(Ard,1,'uchar');
        %concat string
        instr=[instr inbyte];
    end
    
    if (inbyte == endchar) % if complete resp has been sent
        
        %disp(['string in was: ', instr]);
        
        [cmd,dataout,outstr]=ScouseTom_ard_parseinput(instr); %read the data from the input string
        
        switch cmd
            case -1 % there has been an error - stop the recording
                HaltInj(Ard);
                Finished=1;
                warning('Ard sent an error - stopping :(');             
            case 6 % Compliance Warning
                
                %Ard sends compliance status first
                [CompBad,CompBadArray]=ScouseTom_ard_complianceprocess(outstr,N_prt);
                
                %then the number of compliance checking
                [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
                
                if (numflg && cscommok)
                    CurrentCompCheck=resp;
                else
                    CompOK=0;
                    return;
                end
                
                %then the freq number
                [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
                
                if (numflg && cscommok)
                    CurrentCompFreq=resp;
                else
                    CompOK=0;
                    return;
                end
                
                %then the actual compliance in mV
                
                [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
                
                if (numflg && cscommok)
                    CurrentComp=resp;
                else
                    CompOK=0;
                    return;
                end
                
                fprintf('Check %d|Freq %d| Comp %d mV - COMPLIANCE OUT OF RANGE on %d of %d protocol\n',CurrentCompCheck,CurrentCompFreq,CurrentComp,  CompBad,N_prt);
                
                CompBadAll(CurrentCompCheck,CurrentCompFreq)=CompBad;
                CompBadArrayAll(CurrentCompCheck,CurrentCompFreq)={CompBadArray};
                
                
                
            case 7 % compliance finished
                Finished=1;
                disp('All compliances checked');
                
        end
        
        %reset instring and in byte now one completed
        instr='';
        inbyte='X';
    end
    
end

if FS.Stop() %if user hit the stop button
    HaltInj(Ard)
    disp('User hit stop early! ermergerd!');
    
end
FS.Clear(); %get rid of the loop button

FlushSerialBuffer(Ard); % flush the serial buffer


%% Process the results of the compliance check

if any(CompBadAll)
    
CompOk=0;
else
    CompOK=1;
% asdasd

end

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