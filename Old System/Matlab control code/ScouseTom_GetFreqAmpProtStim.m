function [ Ampl, Freq, Prot, Elec_num,Meas, TotalTime,StimulatorTriggerTime, StimulatorTriggerOffset] = ScouseTom_GetFreqAmpProtStim(varargin)
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
prompt = {'Enter Amplitude (A). Uses spaces to define multiple values (e.g. 100e-6 1e-3)','Enter Frequency (Hz). Uses spaces to define multiple values','Number of Electrodes','Measurement Time for each injection pair (ms)','Total Recording Time (s)','Stimulator Trigger Time (ms)','Stimulator Trigger Offset (ms)'};
dlg_title = 'Input Values - VERY LITTLE ERROR CHECKING!';
num_lines = 1;
def = {'0.2E-3','1000','32','500','60','100','2'};

if ~isempty(varargin)
    
    for ii = 1:length(varargin)
        def(ii)={num2str(varargin{ii})};
    end
    
end


a =inputdlg(prompt,dlg_title,num_lines,def);
if isempty(a) ==1
    error('user pressed cancel');
end

Ampl = sscanf(cell2mat(a(1)),'%f');
Freq = sscanf(cell2mat(a(2)),'%f');
Elec_num = sscanf(cell2mat(a(3)),'%f',1); %ignore multiple inputs
Meas = sscanf(cell2mat(a(4)),'%f',1); %ignore multiple inputs
TotalTime = sscanf(cell2mat(a(5)),'%f',1);%ignore multiple inputs
StimulatorTriggerTime = sscanf(cell2mat(a(6)),'%f',1);%ignore multiple inputs
StimulatorTriggerOffset  = sscanf(cell2mat(a(7)),'%f',1);%ignore multiple inputs

%% error checking

if isnumeric(Ampl) ~= 1
    error('Weird Amplitude');
elseif any(Ampl < 0)
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

if StimulatorTriggerTime > Meas
    error('StimulationTime is greater than measurement time');
end

if Meas < StimulatorTriggerOffset
    error('Trigger offset is greater than measurement time');
end


%%

    [filename, pathname] = uigetfile({'*.txt;*.prt','Protocol Files (*.txt,*.prt)';}, 'Choose which Protocol file to load');
    if isequal(filename,0) || isequal(pathname,0)
        error('User pressed cancel on protocol select')
    else
        disp(['User selected protocol file:  ', fullfile(pathname, filename)])
    end
    
    fname =fullfile(pathname,filename);

Prot=load(fname);


%Query user if any current values are larger than 2mA
if Ampl(Ampl>2e-3)
    error('Way too large amplitude');
    %     if isequal(questdlg('One or more current values are high (>2mA). Is this correct? Large currents can damage components!','title','Yes','No','Yes'),'No')
    %     [Ampl, Freq, Prot, Elec_num,Meas, TotalTime] = GetFreqAmplProt;
    %     end
end

end

