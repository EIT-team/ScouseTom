function [  ] = ScouseTom_ard_sendaciinum(Ard,Num)
%SendAsciiNum Send number to arduino in correct format <###>
%Inputs:
%   S - Serial structure
%   Num - integer to send. Careful of the format, arduino expects 16bit OR
%   32bit long int depending on which receive function is being called on
%   arduino. number is coerced to integer


if (floor(Num) == ceil(Num)) == 1
    %if integer then send
fprintf(Ard,'<%d>',Num);
else
    warning('number not integer, rounding to nearest int');
    %if not warn and round to nearest then send
fprintf(Ard,'<%d>',fix(Num));
end




end

