function [ valout,numflag, okflag ] = ScouseTom_ard_getresp( Ard )
%ScouseTom_ard_getresp read number output from arduino in the form <###> from
%ascii to double
%   reads bytes until the pattern <###> is found, then converts the ###
%   from ascii characters to either a string if a command, or number 
%inputs
%   Ard - Serial Structure
%outputs
%   valout - thing inside <>
%   numflag - was thing a number?
%   okflag - goodness flag

okflag=1;

%characters srrounding number
startchar='<';
endchar='>';

inbyte='X'; %set to this as empty string confuses ~=
instr='';


%declare timing variables
start=tic;
elapsed=0;
timeout=2;

%run until end character is read
while ((inbyte ~= endchar) && elapsed < timeout)
    
    elapsed=toc(start);
    
    
    %read one byte
    
    if (Ard.BytesAvailable > 0)
                
        inbyte=fread(Ard,1,'uchar');        
        %concat string
        instr=[instr inbyte];
    end
    
end

%disp(['string in was: ', instr]);

start_idx=strfind(instr,startchar);
end_idx=strfind(instr,endchar);

%find number within the brackets
data_rec=sscanf(instr(start_idx+1:end_idx-1),'%s');

num_rec=str2num(data_rec);

if isempty(num_rec)
    valout=data_rec;
    numflag=0;
else
    valout=num_rec;
    numflag=1;
end


%if no number found then error
if isempty(data_rec)
    okflag=0;
end





end

