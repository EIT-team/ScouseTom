% this runs the set up of the current sources and arduino for a SINGLE
% MEASUREMENT

% ADD THIS TO PATH C:\Users\Anna\James\ScouseTom\src\matlab


load('E:\Jimmy\Testing_log.mat')

% run this first time
[Ard]=ScouseTom_Init('COM18');

% this in ms so 30,000 is 30 seconds
ExpSetup.MeasurementTime=30000;
% this is in ms, and we want to set it to not a multiple of 50Hz 
ExpSetup.StimulatorTriggerTime=988; % approx 1sec


ExpSetup.CSStimAmp= 1500e-6; % this in in AMPS so you need e-6;
ExpSetup.StimulatorPulseWidth  = 1000;% this is in us


ExpSetup.Freq = 1200; % Hz
ExpSetup.Amp = 20; %uA

% send settings to controllers and current source
[Ard,ExpSetup,isok]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM17');

% then you need to run this:
% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);
% in the command window

% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);


disp('DONE DONE DONE DONE DONE DONE');
