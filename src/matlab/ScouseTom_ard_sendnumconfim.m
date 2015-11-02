function [ flag,errout ] = ScouseTom_ard_sendnumconfim( Ard, Num,varargin )
%SendNumConfim Sends number to arduino and confirms the response. Number
%must be integer, it is roudned and then sent in form <###>. The arduino
%reads this and responds with <###> for confirmation.
%   Inputs:
%   S - Serial Structure
%   Num - Number to send, 16bit int or 32bit long int
%   Name of number - optional, purely for error flag
%   Outputs:
%   flag - goodness flag, high good.
%   errout - error string if thats what was read

%if not integer round and warn
if (floor(Num) == ceil(Num)) == 0;
    Num=fix(Num);
    warning(['Number not integer, rounded to', Num]);
end

%if c
if ischar(varargin{1})
    numname=varargin{1};
else
    numname ='some number or other';
end


flag=0;
errout='';

%send number
ScouseTom_ard_sendaciinum(Ard,Num);
%receive number
[in,numflag,comok]=ScouseTom_ard_getresp(Ard);

if (~numflag || ~comok)
    warning(['Communication error attempting to send ' numname])
    flag =0;
    errout=in;
end

if ((in == Num) && numflag)
    flag=1;
else
    warning(['Unexpected response from ard sending ' numname '. Expected ' num2str(Num) 'received ' num2str(in)])
    flag=0;
end




end

