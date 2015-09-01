function [Ard] = ScouseTom_CheckTrigger(Ard)
%ScouseTom_CheckTrigger All 8 indicator pins go high for 1ms and low for
%10ms 200 times (defined in pins.h) - use this to check if the connections are ok by looking at
%biosemi screen
%   Detailed explanation goes here


%% START TRIGGER MOFO

disp('Starting Indicator Pulses - MAKE SURE NOTHING IS ATTACHED TO STIMULATOR');
pause(1)
disp('Starting pulses');
 %start arduino going
fprintf(Ard,'T');

%currently no output from arduino when done. so just wait
pause(5);

disp('Indicator Test finished');
        




end

