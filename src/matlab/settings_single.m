% this runs the set up of the current sources and arduino for a SINGLE
% MEASUREMENT

% ADD THIS TO PATH C:\Users\Anna\James\ScouseTom\src\matlab


% load('E:\Jimmy\Testing_log.mat')
load('ExpSetup_nerve.mat');

ExpSetup.Protocol=[1 2];
% run this first time
[Ard]=ScouseTom_Init('COM18');

%Experimental Parameters
% Runtime --> this in ms so 30,000 is 30 seconds 
ExpSetup.MeasurementTime = 46000;
% this is in ms, and we want to set it to not a multiple of 50Hz 
ExpSetup.StimulatorTriggerTime = 497; % approx 1sec

ExpSetup.StimulatorPulseWidth = 250;

%Keithley - EIT current settings...
ExpSetup.Freq = 225; % Hz
ExpSetup.Amp = 50; % uA

% send settings to controllers and current source
% [Ard,ExpSetup,isok]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM23');

[Ard,ExpSetup,isok]=ScouseTom_SendSettings(Ard,ExpSetup);



% SetupCS_ExtTrig('COM17', ExpSetup.CSStimAmp, ExpSetup.StimulatorPulseWidth/1000000);


%%
% then you need to run this:
% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);
% in the command window

% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);


disp('DONE DONE DONE DONE DONE DONE');
