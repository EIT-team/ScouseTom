function [ S,CurrentSource,ExpSetup ] = ScouseTom_Zinject( S,CurrentSource,ExpSetup )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

Ampl=ExpSetup.Ampl;
Freq=ExpSetup.Freq;
Elec_num=ExpSetup.Elec_num;

%% Prompt User to start

%Ask user if they want to continue/cancel.
%Opens a dialog, and compares the output to 'Start'. If start has been pressed, script
%continues. If 'Cancel' is pressed, script ends.
if isequal(questdlg('Press Start To Begin Contact Check. START BIOSEMI RECORDING NOW','title','Start','Cancel','Start'),'Start')
else
    fprintf(CurrentSource, 'DISP:TEXT "Injection Cancelled"');
    pause(1)
    fprintf(CurrentSource, 'SYST:PRES');
        fclose(S);
    clear('S');
    error('User Canceled Operation');
end


%% Collect contact impedance data first

%perform contact check before collecting data. first amp and frequency used

%timestamp this Z Check
NZChecks=size(ExpSetup.Timestamps.Zchecks,1);
ExpSetup.Timestamps.Zchecks(NZChecks+1)=now;


%time to collect contact impedance data set
ZcheckTime=ExpSetup.ContactCheckInjectTime*Elec_num/1000;

%change front panel
fprintf(CurrentSource, 'DISP:TEXT "CONTACT CHECK"');
fprintf(CurrentSource, 'DISP:WIND2:TEXT "Just a sec"');
%set freqy and amp
fprintf(CurrentSource, 'SOUR:CURR:COMP 1.9');

eval(['fprintf(CurrentSource, ''SOUR:WAVE:FREQ ',num2str(Freq(1)), ''')' ]);
eval(['fprintf(CurrentSource, ''SOUR:WAVE:AMPL ',num2str(Ampl(1)), ''')' ]);
fprintf(CurrentSource, 'SOUR:WAVE:ARM');
fprintf(CurrentSource, 'SOUR:WAVE:INIT');


%turn on current source
fprintf(CurrentSource, 'SOUR:WAVE:ARM');
fprintf(CurrentSource, 'SOUR:WAVE:INIT');

%wait a bit
pause(0.1)

%send command to arduino
fprintf(S,'C');

disp('Contact Checking now');

Zstart=tic;
Zelapsedtime=0;

FSZ = stoploop({'Contact Check is happening',  'Hit Ok to STOP EARLY'});

while(~FSZ.Stop() &&  Zelapsedtime < ZcheckTime)
    Zelapsedtime=toc(Zstart);
end

FSZ.Clear();

%little extra pause to ensure it finished
pause(0.5);



%stop current source
fprintf(CurrentSource, 'SOUR:WAVE:ABOR');
%change front panel
fprintf(CurrentSource, 'DISP:TEXT "Z Check Done"');
fprintf(CurrentSource, 'DISP:WIND2:TEXT "Nice one!"');
pause(1);

disp('Contact Check Finished');
disp('System Now Idle');

%% save expinfo again

fname=fullfile(ExpSetup.dname,'ExperimentInfo.mat');

save(fname,'ExpSetup');




end

