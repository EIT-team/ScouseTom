function [ CMD,DataOut,StringOut ] = ScouseTom_ard_parseinput( StringIn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% Possible inputs

%this must be the same as the Errors.h

%expected stuff:

Error_prefix='!';
Message_prefix='+';

Repeat_prefix='R';
Prt_prefix='P';
Freqord_prefix='O';
Phaseord_prefix='D';
Compliance_prefix='C';

CScommerrmsg='!E';
CSsettingserrmsg='!S';
CSpmarkerrmsg = '!P';
SwitchPWRerrmsg = '!Wp';
SwitchOpenerrmsg = '!Ws';
CScomplianceerrmsg = '!C';
CSTimeouterrmsg='!To';

CScommOKmsg='+OK';
CSfinishmsg='+Fin';
SwitchOKmsg = '+SW';
ComplianceOKmsg = '+C';




%% Process Input


%characters srrounding number
startchar='<';
endchar='>';


start_idx=strfind(StringIn,startchar);
end_idx=strfind(StringIn,endchar);
StringOut=StringIn(start_idx+1:end_idx-1);

cmdstr=StringIn(start_idx+1); %get the first "command" character

%the rest is the data, either a sring for the errors and ok flags, or a
%single number for repeat and protocol, or comma separated array for freq
%order and phase order
datastr=StringIn(start_idx+2:end_idx-1);

% disp(['cmd is ' cmd]);
% disp(['datastr is ' datastr]);

%% Do stuff based on the CMD


switch cmdstr
    case Error_prefix % error!
        [CMD,DataOut]=ParseError(datastr);
    case Message_prefix % ok message
        [CMD,DataOut]=ParseMessage(datastr);
        
    case Repeat_prefix % new repeat num
        CMD=2;
        DataOut=sscanf(datastr,'%d');
    case Prt_prefix % new prot line num
        CMD=3;
        DataOut=sscanf(datastr,'%d');
    case Freqord_prefix % new freq order array
        CMD=4;
        tmp=textscan(datastr,'%d','delimiter',',');
        DataOut=double(tmp{1}');
    case Phaseord_prefix % new phase order array
        CMD=5;
        tmp=textscan(datastr,'%d','delimiter',',');
        DataOut=double(tmp{1}');
    case Compliance_prefix
        CMD=6;
        tmp=textscan(datastr,'%d','delimiter',',');
        DataOut=double(tmp{1}');
    otherwise
        CMD=-99;
        DataOut=-99;
        
end



end

function [CMD,DataOut]=ParseMessage(datastr)

CScommOKmsg='OK';
CSfinishmsg='Fin';
SwitchOKmsg = 'SW';
ComplianceOKmsg = 'C';

switch datastr
    
    case CScommOKmsg
        %comm ok
        CMD=0;
        DataOut=0;
        
    case CSfinishmsg %finished inj
        CMD=1;
        DataOut=1;
        
    case SwitchOKmsg
        CMD = 10;
        DataOut=1;
    case ComplianceOKmsg
        CMD=7;
        DataOut=1;
        
end

end

function [CMD,DataOut]=ParseError(datastr)

CScommerrmsg='E';
CSsettingserrmsg='S';
CSpmarkerrmsg = 'P';
SwitchPWRerrmsg = 'Wp';
SwitchOpenerrmsg = 'Ws';
CScomplianceerrmsg = 'C';
CSTimeouterrmsg= 'To';

CMD=-1; %all error have same code

%certain error codes mean we should stop injection, others we can carry on

switch datastr
    
    case CScommerrmsg
        %CS comm bad, this is
        DataOut=1;
    case SwitchPWRerrmsg
        %CS comm bad, this is
        DataOut=1;
    case SwitchOpenerrmsg
        %CS comm bad, this is
        DataOut=1;

    otherwise
        DataOut=0;
        
        
end

end



