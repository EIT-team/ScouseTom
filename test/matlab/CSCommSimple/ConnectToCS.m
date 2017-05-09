function [obj1] = ConnectToCS( COM )
%ConnectToCS
%Initialises Current Source as an object to enable serial communication.
%MAKE SURE RS-232 COMM MODE IS ON AND SET CORRECT BAUD RATE - 57600
%Enable display on text on front panel of CS.
%
%Inputs - COM, string specifiying which COM port the Current Source is
%connected to e.g. 'COM3'
%Outputs - obj1, object used to send serial output to Current Source


% Find a serial port object.
obj1 = instrfind('Type', 'serial', 'Port', COM, 'Tag', '');

% Create the serial port object if it does not exist
% otherwise use the object that was found.
if isempty(obj1)
    obj1 = serial(COM);
else
    fclose(obj1);
    obj1 = obj1(1);
end

% Connect to instrument object, obj1.
fopen(obj1);
set(obj1, 'BaudRate', 57600);


%Enable front panel text display
fprintf(obj1, 'DISP:TEXT:STAT 1');
fprintf(obj1, 'DISP:WIND2:TEXT:STAT 1');
pause(1);
fprintf(obj1, 'DISP:TEXT "SCOUSETOM WOO!"');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "yay"');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "lets do this"');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "come on"');
pause(1);
fprintf(obj1, 'DISP:TEXT "Communication OK"');
fprintf(obj1, 'DISP:WIND2:TEXT "So thats good"');

disp('Current Source Connected OK');
%disable current source if it is con already
fprintf(obj1, 'SOUR:WAVE:ABOR');
%set compliance to 2V
fprintf(obj1, 'SOUR:CURR:COMP 2');


% setup wave

%sin or square wave
fprintf(obj1, 'SOUR:WAVE:FUNC SIN');
%fprintf(obj1, 'SOUR:WAVE:FUNC SQU');

%amp and freq hardcoded
fprintf(obj1, 'SOUR:WAVE:AMPL 1e-3');
fprintf(obj1, 'SOUR:WAVE:FREQ 50');

% un comment for a CS controlled duration
%fprintf(obj1, 'SOUR:WAVE:DUR:TIME 20');

pause(1);

%make CS ready
fprintf(obj1, 'SOUR:WAVE:ARM');

% start it going
fprintf(obj1, 'SOUR:WAVE:INIT');

disp('injecting');

% do other stuff here
pause(10);


% stop CS
fprintf(obj1, 'SOUR:WAVE:ABOR');

disp('done');


end


