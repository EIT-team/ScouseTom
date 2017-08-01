load('Testing_log.mat')


%% RAMP REC for 11 - 12
AMP_RAMP =      [ 5 250 500 1000 1500 2000 4000 ]*1e-6;
WIDTH_RAMP =     100*ones(size(AMP_RAMP));
%% RAMP REC for 13
AMP_RAMP =      [ 5 250 500 1000 1500 2000 4000 ]*1e-6;
WIDTH_RAMP =     100*ones(size(AMP_RAMP));
%% RAMP REC for 14
AMP_RAMP =      [ 5 1000 2000 4000 8000 16000 ]*1e-6;
WIDTH_RAMP =     100*ones(size(AMP_RAMP));
%% RAMP REC for 16
AMP_RAMP =      [ 5 2000 4000 8000 16000 32000 ]*1e-6;
WIDTH_RAMP =     50*ones(size(AMP_RAMP));


ExpSetup.MeasurementTime=10000;
ExpSetup.StimulatorTriggerTime=988;


for iSettings = 1:size(AMP_RAMP,2);
    
    
    ExpSetup.CSStimAmp= AMP_RAMP(iSettings); % this in in AMPS so you need e-6;
    ExpSetup.StimulatorPulseWidth  = WIDTH_RAMP(iSettings);% this is in us
    
    
    % send settings to controllers and current source
    [Ard,ExpSetup,isok]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM17');
    
    % then you need to run this:
    % [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);
    % in the command window
    
    [ Ard,ExpSetup]=ScouseTom_Start(Ard,ExpSetup,1);
    
%     save(['ExpSetup_' numstr(iSettings)];
    
end

disp('DONE DONE DONE DONE DONE DONE');
