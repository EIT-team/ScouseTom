function [ Flag ] = SendArduinoExpSetupStim( S,Prt,N_elec,InjectionTime,ContactImpedanceTime,StimulatorTriggerTime,StimulatorTriggerOffset)
%SendArduinoExpSetup Sends the information of the protocol, time to inject
%per protocol line and the time to inject on each pair during contact
%impedance measurements

% STIM VERSION - Added extra inputs for stimulator - period and offset
%   
% Data is sent in the form <###> with confirmation.
% Inputs:
%   S - Arduino Serial structre
%   Prt - vector for injection protocol, must be pairs and less than max
%   channel 37. Nx2
%   N_elec - number of electrodes, used in contact impedance measurement.
%   So this should equal the highest numbered electrode you are using. 
%   InjectionTime - Time in ms for each injection pair before switching to
%   the next. Must be greater than 3 ms (5 ms for safety) and less than
%   half an hour (32 bit int)
%   ContactImpedanceTime - InjectionTime but for contact impedance check
%   only.
%
%   Outputs:
%   Flag - badness flag, low is good
%% Parse inputs
if size(Prt,2) ~= 2 
    error('weird protocol vector');
end

if isempty(ContactImpedanceTime) ==1
    ContactImpedanceTime=500;
end

if max(max(Prt)) > N_elec
    warning('Number of electrodes lower than the maximum channel');
end

if InjectionTime < 3
    error('Injection time too small');
elseif InjectionTime < 5
    warning('You might be cutting it a bit fine with the injection time!');
end

if ContactImpedanceTime < 3
    error('ContactImpedanceTime time too small');
elseif ContactImpedanceTime < 5
    warning('You might be cutting it a bit fine with the ContactImpedanceTime !');
end

%% Send Protocol Info

N_prt = size(Prt,1);
Flag(1)=SendNumConfirm(S,N_prt,'Protocol Length');
Flag(2)=SendNumConfirm(S,N_elec,'Number of Electrodes');
Flag(3)=SendNumConfirm(S,InjectionTime,'Injection Time');
Flag(4)=SendNumConfirm(S,ContactImpedanceTime,'Contact Z Time');
Flag(5)=SendNumConfirm(S,StimulatorTriggerTime,'Stimulator Trigger Time');
Flag(6)=SendNumConfirm(S,StimulatorTriggerOffset,'Stimulator Trigger Offset');

disp('Protocol info sent OK');

%% Send protocol 

%send sources
for n=1:N_prt
    Flag(5)=SendNumConfirm(S,Prt(n,1),['Source ' num2str(Prt(n,1))]);
end

%send sinks
for n=1:N_prt
    Flag(6)=SendNumConfirm(S,Prt(n,2),['Sink ' num2str(Prt(n,2))]);
end

disp('Protocol Lines sent OK');
Flag = sum(Flag);
end

