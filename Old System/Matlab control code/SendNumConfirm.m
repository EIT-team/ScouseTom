function [ flag ] = SendNumConfirm( Ard, Num,varargin )
%SendNumConfim Sends number to arduino and confirms the response. Number
%must be integer, it is roudned and then sent in form <###>. The arduino
%reads this and responds with <###> for confirmation.
%   Inputs:
%   S - Serial Structure
%   Num - Number to send, must be either 16bit int or 32bit long int.
%   Arduino code has separate commands for each of these. BUT THIS DOESNT
%   SO YOU HAVE TO KNOW THE CORRECT ORDER
%   Name of number - optional, purely for error flag
%   Outputs:
%   Flag - goodness flag, high good.

%if not integer round and warn
if (floor(Num) == ceil(Num)) == 0;
    Num=fix(Num);
    warning(['Number not integer, rounded to', Num]);
end

%if c
if ischar(varargin) == 0
    numname ='some number or other';
end

    
flag=1;


%send number
SendAsciiNum(Ard,Num);
%receive number
[in,comok]=ReadAsciiNum(Ard);
disp(in)
disp(comok);


if (in ~= Num || comok)
    error(['Communication error attempting to send ' numname])
    flag =0;
end



end

