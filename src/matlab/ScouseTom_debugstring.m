function [ dbstring ] = ScouseTom_debugstring( ExpSetup )

% function to create the string sent to arduino for these settings
%useful for debuging in the Serial montior of Arduino or Termite
% Send command 'I' followed by 'A' followed by these lines

dbstring='';

dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.ProtocolLength)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Elec_num)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.FreqNum)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Repeats)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.ContactCheckInjectTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerOffset)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorPulseWidth)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorWiperSetting)];

for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Freq(nn))];
end
for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Amp(nn))];
end
for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.MeasurementTime(nn))];
end


if ~(isfield(ExpSetup,'Bad_Elec')) %if the field does not exist
    dbstring=[dbstring sprintf('<%d>',0)];
else
    if isempty(ExpSetup.Bad_Elec) % and some bad ones have been enterred
    dbstring=[dbstring sprintf('<%d>',0)];
    else
            dbstring=[dbstring sprintf('<%d>',length(ExpSetup.Bad_Elec))];
    for nn=1:length(ExpSetup.Bad_Elec)
        dbstring=[dbstring sprintf('<%d>',ExpSetup.Bad_Elec(nn))];
    end
    end
end


end
