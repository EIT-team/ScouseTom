function [ BadNum, BadArray ] = ScouseTom_ard_complianceprocess( ComplianceString, N_prt )
%SCOUSETOM_ARD_COMPLIANCEPROCESS converts output of compliance string into
%a count of bad protocol lines and logical array of badness
%   Detailed explanation goes here

%% Convert Integers into bit array

%get each integer - ignore first char as its the "C"
StrCell=textscan(ComplianceString(2:end),'%s','delimiter',',');
StrCell=StrCell{1};

%number of bitarrays sent
NumSent=size(StrCell,1);

%preallocate
IntArray=uint32(zeros(1,8));
LogArray=[]; %sort of

%convert each string into a 32bit integer and then into an array of bits 
for i=1:NumSent
    IntArray(i)=sscanf(StrCell{i},'%li'); %read as long int 32 bit
    %convert into array of 1 and 0 and append - flipped as written in LSB order, but we want LogArray(1) to be equivalent to Protocol line 1
    LogArray=[LogArray, fliplr(dec2bin(IntArray(i),32)-'0')]; 
end

%truncate based on the number of protocol lines
BadArray=LogArray(1:N_prt);

%find number of bad electrodes
BadNum=size(find(BadArray),2);

