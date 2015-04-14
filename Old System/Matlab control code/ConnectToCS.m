function obj1 = ConnectToCS( COM )
%ConnectToCS
%Initialises Current Source as an object to enable serial communication.
%Enable display on text on front panel of CS.
%
%Inputs - COM, string specifiying which COM port the Current Source is
%connected to
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
set(obj1, 'BaudRate', 19200);


%Enable front panel text display
fprintf(obj1, 'DISP:TEXT:STAT 1');
fprintf(obj1, 'DISP:WIND2:TEXT:STAT 1');
pause(1);
fprintf(obj1, 'DISP:TEXT "TOM=NOTORIOUS L.A.D."');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "lads"');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "ladslads"');
pause(.2);
fprintf(obj1, 'DISP:WIND2:TEXT "ladsladslads"');
pause(1);
fprintf(obj1, 'DISP:TEXT "Communication OK"');
fprintf(obj1, 'DISP:WIND2:TEXT "So thats good"');

fprintf(obj1, 'SOUR:CURR:COMP 1.9');

disp('Current Source Connected OK');

end

