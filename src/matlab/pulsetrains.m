% function [obj1,obj2] = pulsetrains(COMCS,COMARD)
function [obj1] = pulsetrains(COMCS, Amp, PW)
%Inputs - COM, string specifiying which COM port the Current Source is
%connected to
%Outputs - obj1, object used to send serial output to Current Source
 
% Frequency = 8; %Frequency of pulse trains
% Duration = 10; %Duration of pulse trains
Amplitude = Amp; % 1e-3; %Amplitude of peak of pulse, A
Pulse_width =  PW; %0.1e-3; %Pulse width you want for the positive bit, s
Compliance = 12; %If it starts flashing make this higher, V
 
%Initialise arbitrary waveform
Points = zeros(100,1);
% Points([1:10],1) = 1;
% Points([11:100]) = -0.111;
Points([1:10],1) = 1;
Points([11:20],1) = -1;
points = sprintf('%d ,', Points);
points = points(1:end-1);
 
%Determine the frequency we need to set current source at 
Time_point = Pulse_width/10; %Duration of each point in Points
Freq = round(1/(100*Time_point)); 
 
%Determine pause time and number of times we need to send init
% Pause_time = 1/Frequency;
% N_init = Frequency * Duration;
 
%Create strings to send to current source
ARB_POINTS = sprintf('SOUR:WAVE:ARB:DATA %s', points);
AMP = sprintf('SOUR:WAVE:AMPL %d', Amplitude);
FREQ = sprintf('SOUR:WAVE:FREQ %d', Freq); %N.B NOT frequency
DUR = sprintf('SOUR:WAVE:DUR:CYCL 1'); %Always set this to just do one cycle 
COMP = sprintf('SOUR:CURR:COMP %d', Compliance);
 
%Communicate with current source
% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', COMCS, 'Tag', '');
%obj2 = instrfind('Type', 'serial', 'Port', COMARD, 'Tag', '');
 
% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial(COMCS);
else
    fclose(obj1);
    obj1 = obj1(1);
end
 
% if isempty(obj2)
%     obj2 = serial(COMARD);
% else
%     fclose(obj2);
%     obj2 = obj2(1);
% end
% 
 
 
set(obj1, 'BaudRate', 57600);
set(obj1, 'OutputBufferSize', 1500);
% Connect to instrument object, obj1.
fopen(obj1);
% set(obj1, 'BaudRate', 57600);
% set(obj1, 'OutputBufferSize', 1024);
 
 
% set(obj2, 'BaudRate', 115200);
% set(obj2, 'OutputBufferSize', 1500);
% % Connect to instrument object, obj1.
% fopen(obj2);
 
 
 
 
fprintf(obj1, '*RST');
 
%Enable front panel text display
fprintf(obj1, 'DISP:TEXT:STAT 1');
fprintf(obj1, 'DISP:WIND2:TEXT:STAT 1');
fprintf(obj1, 'DISP:TEXT "Epilepsy and all"');
 
%Initialise current source
fprintf(obj1, 'SOUR:WAVE:ABOR');
fprintf(obj1, ARB_POINTS);
fprintf(obj1, 'SOUR:WAVE:FUNC ARB0');
fprintf(obj1, COMP);
fprintf(obj1, AMP);
fprintf(obj1, FREQ);
fprintf(obj1, DUR);
%Enable external triggering
fprintf(obj1, 'SOUR:WAVE:EXTR:ENAB ON');
fprintf(obj1, 'SOUR:WAVE:EXTR:ILIN 1');
fprintf(obj1, 'SOUR:WAVE:EXTR:IGN OFF');
fprintf(obj1, 'SOUR:WAVE:EXTR:IVAL 0.00');
fprintf(obj1, 'DISP:TEXT "Communication OK"');
fprintf(obj1, 'DISP:WIND2:TEXT "So thats good"');
% pause(1);
fprintf(obj1, 'SOUR:WAVE:ARM');
 
 
fprintf(obj1, 'SOUR:WAVE:INIT');
% pause(.1);
% fprintf(obj2,'e');
% 
% 
% % pause
% fclose(obj2);
% n = 0; % initialise counter
% while(n < N_init)
%     fprintf(obj1, 'SOUR:WAVE:INIT');
%     pause(Pause_time);
%     n = n+1;
% end

