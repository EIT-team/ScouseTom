function [ Amp, Freq, Prot,Prot_name, Elec_num,Meas,Repeats,StimulatorTriggerTime, StimulatorTriggerOffset,StimulatorPulseWidth,StimulatorVoltage] = ScouseTom_SettingsDialog(protflag,varargin)
%GetFreqAmplProt - Prompts user to input amplitude and frequency values,
%and to select a protocol file.
%Outputs - Ampl, Freq and arrays of Amplitude and Frequency values.
%        - Prot is the protocol file.
%        - Measurement Time is how long each injection lasts
%
%To do - better error checking
%
% Adapted from Toms Code by the unctuous yet trustworthy Jimmy

%% prompt user for input
prompt = {'Enter Amplitude (uA). Uses spaces to define multiple - NOTE THIS IS IN MICROS ONLY NOW',...
    'Enter Frequency (Hz). Uses spaces to define multiple values',...
    'Number of Elec.',...
    'Meas. Time for each inj. pair (ms)',...
    'Number of repeats',...
    'Stim. Trig. Time (ms) 0 turns stim off',...
    'Stim. Trig. Offset (ms) 0 turns stim off',...
    'Stim. Pulse Width (us) 0 turns stim off - NOTE THIS IS IN MICROS',...
    'Stim Voltage (V) - closest match within 0.125V'};

dlg_title = 'Input Values - VERY LITTLE ERROR CHECKING!';
num_lines = 1;
%set defaults
def = {'141','1000','32','500','20','100','2','0','10'};

%replace defaults with input varargin
if ~isempty(varargin)
  
    for ii = 1:length(varargin)
        def(ii)={num2str(varargin{ii}')}; %have to transpose inside to make arrays convert to space delimited strings
    end
    
end

%run dialog
a =inputdlg(prompt,dlg_title,num_lines,def);
if isempty(a) ==1
    error('user pressed cancel');
end

%stick into variables 
Amp = sscanf(cell2mat(a(1)),'%f');
Freq = sscanf(cell2mat(a(2)),'%f');
Elec_num = sscanf(cell2mat(a(3)),'%f',1); %ignore multiple inputs
Meas = sscanf(cell2mat(a(4)),'%f',1); %ignore multiple inputs
Repeats = sscanf(cell2mat(a(5)),'%f',1);%ignore multiple inputs
StimulatorTriggerTime = sscanf(cell2mat(a(6)),'%f',1);%ignore multiple inputs
StimulatorTriggerOffset  = sscanf(cell2mat(a(7)),'%f',1);%ignore multiple inputs
StimulatorPulseWidth = sscanf(cell2mat(a(8)),'%f',1);%ignore multiple inputs
StimulatorVoltage = sscanf(cell2mat(a(9)),'%f',1);%ignore multiple inputs

%% error checking - badly coded

if isnumeric(Amp) ~= 1
    error('Weird Amplitude');
elseif any(Amp < 0)
    error('Weird Amplitude');
end

if isnumeric(Freq) ~= 1
    error('Weird Frequency');
elseif any(Freq < 0)
    error('Weird Frequency');
end

if isnumeric(Elec_num) ~= 1
    error('Weird Number of Electrodes must be positive integer');
elseif ceil(Elec_num) ~= fix(Elec_num)
    error('Weird Number of Electrodes must be positive integer');
elseif Elec_num < 0
    error('Weird Number of Electrodes must be positive integer');
end

if isnumeric(Repeats) ~= 1
    error('Weird Number of Repeats must be positive integer');
elseif ceil(Repeats) ~= fix(Repeats)
    error('Weird Number of Repeats must be positive integer');
elseif Repeats < 0
    error('Weird Number of Repeats must be positive integer');
end



if isnumeric(Meas) ~= 1
    error('Weird measurement time must be positive integer');
elseif ceil(Meas) ~= fix(Meas)
    error('Weird measurement time must be positive integer');
elseif Meas < 0
    error('Weird measurement time must be positive integer');
end


if isnumeric(StimulatorTriggerTime) ~= 1
    error('Weird StimulatorTriggerTime must be positive integer');
elseif ceil(StimulatorTriggerTime) ~= fix(StimulatorTriggerTime)
    error('Weird StimulatorTriggerTime must be positive integer');
elseif StimulatorTriggerTime < 0
    error('Weird StimulatorTriggerTime must be positive integer');
end


if isnumeric(StimulatorTriggerOffset) ~= 1
    error('Weird StimulatorTriggerOffset must be positive integer');
elseif ceil(StimulatorTriggerOffset) ~= fix(StimulatorTriggerOffset)
    error('Weird StimulatorTriggerOffset must be positive integer');
elseif StimulatorTriggerOffset < 0
    error('Weird StimulatorTriggerOffset must be positive integer');
end

if isnumeric(StimulatorPulseWidth) ~= 1
    error('Weird StimulatorTriggerOffset must be positive integer');
elseif ceil(StimulatorPulseWidth) ~= fix(StimulatorPulseWidth)
    error('Weird StimulatorTriggerOffset must be positive integer');
elseif StimulatorPulseWidth < 0
    error('Weird StimulatorTriggerOffset must be positive integer');
end

if isnumeric(StimulatorVoltage) ~= 1
    error('Weird StimulatorVoltage must be positive number');
elseif StimulatorPulseWidth < 0
    error('Weird StimulatorVoltage must be positive number');
end




if StimulatorTriggerTime > Meas
    error('StimulationTime is greater than measurement time');
end

if Meas < StimulatorTriggerOffset
    error('Trigger offset is greater than measurement time');
end


%% new protocol bit

if protflag
    
    [filename, pathname] = uigetfile({'*.txt;*.prt','Protocol Files (*.txt,*.prt)';}, 'Choose which Protocol file to load');
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel on protocol select')
    else
        disp(['User selected protocol file:  ', fullfile(pathname, filename)])
    end
    
    fname =fullfile(pathname,filename);
    
    Prot=load(fname);
    Prot_name=filename;
    
else
    Prot=0;
    Prot_name='';
end

%Query user if any current values are larger than 2mA
if any(Amp>2000)
    warning('Large amplitude');
    %     if isequal(questdlg('One or more current values are high (>2mA). Is this correct? Large currents can damage components!','title','Yes','No','Yes'),'No')
    %     [Ampl, Freq, Prot, Elec_num,Meas, TotalTime] = GetFreqAmplProt;
    %     end
end

end

