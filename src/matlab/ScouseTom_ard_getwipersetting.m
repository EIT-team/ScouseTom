function [ out,varargout ] = ScouseTom_ard_getwipersetting( in )
%ScouseTom_ard_getwipersetting Get wiper setting for target stimulator
%voltrage
%   if input is ExpSetup then target voltage taken from
%   ExpSetup.StimulatorVoltage, and value saved in
%   ExpSetup.StimulatorWiperSetting
% Otherwise input is Voltage and out is setting and varargout is actual
% voltage
%
% Wiper settings based on those generated from Stim_cal.vi

%% get Vtarget either from intput number or from field in ExpSetup
if isstruct(in)
    if isfield(in,'StimulatorVoltage');
        Vtarget=in.StimulatorVoltage;
    else
        error('No Stimulator Voltage given');
    end
    
else
    if isnumeric(in)
        
        Vtarget=in;
    else
        error('wierd input');
    end
end

%% load StimCal if it exists
if exist('VstimCal.mat','file') ==2
    load('VstimCal.mat');
else
    disp('No VstimCal found, using defaults instead');
    [Vp,R]=VStimCalHardcode();
    
end

%% find nearest pulse voltage and coorresponding wiper setting

if Vtarget > max(Vp) || Vtarget < min(Vp)
    warning('Target voltage out of bounds of calibration data, result may not be representative');
end
[~,I]=min(abs(Vp-Vtarget)); %min diff between target and Vp steps
Rset=R(I);
Vset=Vp(I);

if isstruct(in)
    in.StimulatorVoltage=Vset;
    in.Info.StimulatorWiperSetting=Rset;
    out=in;
else
    out=Rset;
    varargout{1}=Vset;
end

end



function [Vdef,Rdef]=VStimCalHardcode()
% this is the hardcoded results from when I tested the breadboard version -
% good place to start but likely off by a bit


tmp=[215	10.90
    216	10.67
    217	10.43
    218	10.20
    219	9.97
    220	9.73
    221	9.50
    222	9.27
    223	9.03
    224	8.88
    225	8.64
    226	8.41
    227	8.17
    228	7.94
    229	7.71
    230	7.47
    231	7.24
    232	7.01
    233	6.78
    234	6.54
    235	6.31
    236	6.08
    237	5.84
    238	5.61
    239	5.38
    240	5.22
    241	4.99
    242	4.76
    243	4.52
    244	4.29
    245	4.06
    246	3.83
    247	3.59
    248	2.59];

Vdef=tmp(:,2);
Rdef=tmp(:,1);





end
