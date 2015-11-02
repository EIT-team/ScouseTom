function [ Ard,goodnessflag ] = ScouseTom_ard_init( COMPORTSTR )
%ScouseTom_ard_initialise Setup connection to arduino using
%establishcontact() function
%which sends 'A' (65) until soemthing is writtten to it
%   Inputs:
%   COMPORTSTR - string for com port i.e. 'COM11'
%   timeout - timeout in s for communication (optional)
%   Outputs:
%   S - Serial object
%   flag - goodnessflag flag. 1 is good
%
% written by the dissolute yet munificent Jimmy 2015

if ~isempty(instrfind)
    fclose(instrfind);
end

%arduino resets on opening serial port

%open serial com
Ard=serial(COMPORTSTR,'BaudRate',115200);

% disp('Resetting Arduino');
fopen(Ard); %arduino now reset

%declare timing variables
start=tic;
elapsed=0;
%this has to be set to more than 1 s as fopen resets arduino and 
%some other stuff runs before it establishes contact

timeout =5; 
goodnessflag=0;

in=0;%inbyte

while elapsed < timeout
    
    elapsed=toc(start);
    
    if (Ard.BytesAvailable > 0)
        %read a byte
        in=fread(Ard,1);
         %disp(in)
    end
    
    %input should be 'A' or 65
    if in==65
        %     disp('i can hear arduino');
        fprintf(Ard,'h'); % this can be anything, if its not a capital letter it is ignored
        goodnessflag=1;
        elapsed=timeout+1;
    end
    
end

if goodnessflag==1
%     disp('Communication with Arduino was OK');
else
    disp('Commuinocation with Arduino failed! BOOO');
    fclose(Ard);
end





end

