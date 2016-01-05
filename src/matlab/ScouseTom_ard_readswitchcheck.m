function [ Ard,OKflag ] = ScouseTom_ard_readswitchcheck( Ard )
%SCOUSETOM_ARD_READSWITCHCHECK Summary of this function goes here
%   Detailed explanation goes here

%% Expected error and messages

SwitchPowerErr='!Wp';
SwitchOpenErr='!Ws';
SwitchOKmsg='+SW';

%% flags

%first is switch power

pwrok=0;
openok=0;
numboard=0;


%% First result is power check

disp('Checking Switch Boards, definied by Elec_num in ExpSetup, or 1 at init');

OKflag=0;

[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get OK message from Arduino....');
    return
end
if strcmp(resp,SwitchPowerErr)
    warning('Switch Power Error');
    pwrok=0;
end

if strcmp(resp, SwitchOKmsg)
    %     disp('Switches are powered OK');
    pwrok=1;
end
%% Then switch check on each board

%first ard sends number of boards in use
[resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);

if (~cscommok)
    warning('Didnt get OK message from Arduino....');
    return
end

if numflg
    numboard=resp;
    fprintf('Number of boards in use: %d\n',numboard);
else
    openok=0;
    numboard=0;
    warning('didnt receive number of boards from ard');
end

brdok=0;
%error sent for each board in turn
for iBrd =1:numboard
    
    [resp,numflg,cscommok]=ScouseTom_ard_getresp(Ard);
    if strcmp(resp, SwitchOKmsg)
        %     disp('Switches are powered OK');
        brdok(iBrd)=1;
        fprintf('Board %d is working OK!\n',iBrd);
    else if strcmp(resp,SwitchOpenErr)
            warning('Switch Open Error');
            brdok(iBrd)=0;
            fprintf('Board %d is NOT working\n',iBrd);
        end
    end
    
end

%ok if ALL boards are ok
openok=all(brdok);

%% Final OK flag

if (pwrok && openok)
    disp('Switches Powered and working WOOOOOOOO');
    OKflag=1;
else
    disp('Switches had a problem  #bylad');
end




end

