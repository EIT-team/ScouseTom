function [ S,flag ] = SetupArduinoSerial( COMPORTSTR,varargin )
%SetupSerial Setup connection to arduino using establishcontact() function
%which sends 'A' (65) until soemthing is writtten to it
%   Inputs:
%   COMPORTSTR - string for com port i.e. 'COM11'
%   timeout - timeout in s for communication (optional)
%   Outputs:
%   S - Serial object
%   flag - badness flag. 0 is good 

if isempty(varargin) == 1
    timeout =1;
end

%baddness flag
flag=1;

%reset arduino
RST=serial(COMPORTSTR,'Baudrate',1200);
fopen(RST);
fclose(RST);

%open serial com
S=serial(COMPORTSTR,'BaudRate',9600);

fopen(S);

%declare timing variables
start=tic;
elapsed=0;

while elapsed < timeout

    elapsed=toc(start);
    
%read a byte    
in=fread(S,1);
% disp(in)

%input should be 'A' or 65
if in==65
%     disp('i can hear arduino');
    fprintf(S,'hi');
    flag=0;
    elapsed=timeout+1;
end

end

if flag==0
    disp('Communication with Arduino was OK');
else
    disp('Commuinocation with Arduino failed! BOOO');
    fclose(S);
end





end

