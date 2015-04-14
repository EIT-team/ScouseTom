function [ numout,flag ] = ReadAsciiNum(S)
%readasciinumber read number output from arduino in the form <###> from
%ascii to double
%   reads bytes until the pattern <###> is found, then converts the ###
%   from ascii characters to a double WOOP
%inputs
%   S - Serial Structure
%outputs
%   numout - number read in double form
%   flag - badness flag

flag=0;

%characters srrounding number
startchar='<';
endchar='>';

inbyte='X'; %set to this as empty string confuses ~=
instr='';

%read only until the termination character is read

iCnt=0;


%run until end character is read
while inbyte ~= endchar
    
    iCnt = iCnt+1;
    %read one byte
    inbyte=fread(S,1,'uchar');
    
    %if read the start byte then place pointer there
    if inbyte == startchar;
        startidx=iCnt;
    end
    
    %concat string
    instr=[instr inbyte];

end



%find number within the brackets
numout=sscanf(instr(startidx+1:end-1),'%f');


%if no number found then error
if isempty(numout) == 0
    flag=1;
end

    


