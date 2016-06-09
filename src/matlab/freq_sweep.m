for freq = [500:500:12500]
    ExpSetup.Freq = freq;
    ExpSetup.Amp = 100;
    [Ard,ExpSetup,okflag]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM6');
    [ Ard,ExpSetup ] = ScouseTom_Start( Ard,ExpSetup,1 );
end
%%
for stim_time = [10,20,50,100,200]
    ExpSetup.Freq =9500;
    ExpSetup.Amp = 100;
    ExpSetup.StimulatorTriggerTime = stim_time;
    ExpSetup.MeasurementTime = 150*stim_time;
    [Ard,ExpSetup,okflag]=ScouseTom_SendSettings_CS2(Ard,ExpSetup,'COM6');
    [ Ard,ExpSetup ] = ScouseTom_Start( Ard,ExpSetup,1 );
end