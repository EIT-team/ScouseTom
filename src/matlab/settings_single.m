load('C:\Users\James\Documents\crab\Crab_09\Testing_log.mat')

% run this first time
[Ard]=ScouseTom_Init('COM6');

AMP_RAMP = [ 500 1000 1500 2000 ]*1e-6;
WIDTH_RAMP =  [ 2000 1000 500 1000 ];
ExpSetup.MeasurementTime=30000;

ExpSetup.CSStimAmp= 1000e-6; % this in in AMPS so you need e-6;
ExpSetup.StimulatorPulseWidth  = 500;% this is in us
ExpSetup.Freq = 1200;
ExpSetup.Amp = 20;

% send settings to controllers and current source
[Ard,ExpSetup,isok]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM7');

% then you need to run this:
% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);
% in the command window

% [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);


disp('DONE DONE DONE DONE DONE DONE');
