function [ Ard,SwOKFlag ] = ScouseTom_CheckSwitches( Ard )
%SCOUSETOM_CHECKSWITCHES Checks switches are working
%   Detailed explanation goes here

%% send command

FlushSerialBuffer(Ard); % ignore everything sent before this

fprintf(Ard,'W'); %send command to Arduino

SwOKFlag=ScouseTom_ard_readswitchcheck(Ard); %read response

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
