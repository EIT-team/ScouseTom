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
dbstring=[dbstring sprintf('<%d>',ExpSetup.Compliance)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerTime)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorTriggerOffset)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.StimulatorPulseWidth)];
dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.StimulatorWiperSetting)];



for nn=1:ExpSetup.Info.ProtocolLength
    for s = 1:ExpSetup.Info.Shunt
        dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.Protocol_Sent(nn,s))];
    end
end
for nn=1:ExpSetup.Info.ProtocolLength
    for s = ExpSetup.Info.Shunt+1:ExpSetup.Info.Shunt*2
        dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.Protocol_Sent(nn,s))];
    end
end

for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Freq(nn))];
end
for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.Amp(nn))];
end
for nn=1:ExpSetup.Info.FreqNum
    dbstring=[dbstring sprintf('<%d>',ExpSetup.MeasurementTime(nn))];
end


if ~(isfield(ExpSetup.Info,'Bad_Elec_Sent')) %if the field does not exist
    dbstring=[dbstring sprintf('<%d>',0)];
else
    if isempty(ExpSetup.Info.Bad_Elec_Sent) % and some bad ones have been enterred
    dbstring=[dbstring sprintf('<%d>',0)];
    else
            dbstring=[dbstring sprintf('<%d>',length(ExpSetup.Info.Bad_Elec_Sent))];
    for nn=1:length(ExpSetup.Info.Bad_Elec_Sent)
        dbstring=[dbstring sprintf('<%d>',ExpSetup.Info.Bad_Elec_Sent(nn))];
    end
    end
end


end
