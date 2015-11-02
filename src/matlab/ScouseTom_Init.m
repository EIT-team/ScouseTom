function [ Ard ] = ScouseTom_Init( ArdComPortStr )
%ScouseTom_Init Initialises Arduino Due for ScouseTom v2
%   Resets the Arduino and establishes connection

% Input - ArdComPortStr string for com port i.e. 'COM11'
% Output - Ard - serial object for arduino

% smashed together by jimmy 2015

%% Some variables

CScommerrmsg='!E';
CSpmarkerrmsg='!P';
CScommOKmsg='+OK';

%% close ports if any already open

if ~isempty(instrfind)
    fclose(instrfind);
end

%% Initialise Arduino Serial Object

% in case the arduino communication was opened already
if exist('Ard','var')
    close(Ard);
    clear('Ard');
end


% Reset and Connect to Arduino
[Ard,commgood]=ScouseTom_ard_init(ArdComPortStr);

% check if is all well
if commgood == 0
    fclose(Ard);
    clear('Ard');
    error('Problem with arduino communication at some point');
end

disp('Arduino Connected Fine');
pause(0.2);

%% check CS test response

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get OK message from Arduino....');
end
if strcmp(resp,CScommerrmsg)
    warning('CS COMM ERROR - CHECK FRONT PANEL - autoretry when sending settings to ard');
end

if strcmp(resp,CSpmarkerrmsg)
    warning('WARNING! PHASE MARKER NOT DETECTED! - Stim will not work');
end


if strcmp(resp, CScommOKmsg)
    disp('Current Source connected OK! yay!');
end

%% Check Switching test response

SwOK=ScouseTom_ard_readswitchcheck(Ard);


%% Finish init

FlushSerialBuffer(Ard);
disp('Initilialisation finished - this only needs to work once, new settings can be sent repeatedly');


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




