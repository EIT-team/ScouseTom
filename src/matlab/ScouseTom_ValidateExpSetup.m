function [ goodnessflag,ExpSetup ] = ScouseTom_ValidateExpSetup( ExpSetup )
%ScouseTom_ValidateExpSetup Checks the settings in the ExpSetup structure
%   Users can now edit the ExpSetup and resend settings without going
%   through any of the settings dialogs, so need to check everything before
%   we start


goodnessflag=0;

N_prt = size(ExpSetup.Protocol,1);
N_freq= size(ExpSetup.Freq,1);
N_amp= size(ExpSetup.Amp,1);
N_rep=ExpSetup.Repeats;

if N_freq >1
    SingleFreqMode=0;
else
    SingleFreqMode=1;
end

if (ExpSetup.StimulatorPulseWidth ==0 || ExpSetup.StimulatorTriggerOffset ==0 || ExpSetup.StimulatorTriggerTime ==0)
    StimMode=0;
else
    StimMode=1;
end


%% check if the fields are actually there

legit_fields={'Amp', 'Freq', 'Protocol','Elec_num', 'MeasurementTime',...
    'Repeats','StimulatorTriggerTime','StimulatorTriggerOffset',...
    'StimulatorPulseWidth','ContactCheckInjectTime','ProtocolName',...
    'StimulatorVoltage','StimulatorWiperSetting'};

fieldsok=isfield(ExpSetup,legit_fields);

if (~all(fieldsok))
    warning('Ruhro! Missing fields in ExpSetup');
    return
end

%% check variables make sense - there is DEFINITELY a better way of doing this, like defining a parser or something


if isnumeric(ExpSetup.Amp) ~= 1
    warning('Weird Amplitude');
    return
elseif any(ExpSetup.Amp < 0)
    warning('Weird Amplitude');
    return
end

if isnumeric(ExpSetup.Freq) ~= 1
    warning('Weird Frequency');
    return
elseif any(ExpSetup.Freq < 0)
    warning('Weird Frequency');
    return
end

if ~all(size(ExpSetup.Amp)==size(ExpSetup.Freq))
    warning('Mismatched numbers of frequencies and amplitudes');
    return
end

if isnumeric(ExpSetup.Elec_num) ~= 1
    warning('Weird Number of Electrodes must be positive integer');
    return
elseif ceil(ExpSetup.Elec_num) ~= fix(ExpSetup.Elec_num)
    warning('Weird Number of Electrodes must be positive integer');
    return
elseif ExpSetup.Elec_num < 0
    warning('Weird Number of Electrodes must be positive integer');
    return
end

if isnumeric(ExpSetup.Repeats) ~= 1
    warning('Weird Number of Repeats must be positive integer');
    return
elseif ceil(ExpSetup.Repeats) ~= fix(ExpSetup.Repeats)
    warning('Weird Number of Repeats must be positive integer');
    return
elseif ExpSetup.Repeats < 0
    warning('Weird Number of Repeats must be positive integer');
    return
end



if isnumeric(ExpSetup.MeasurementTime) ~= 1
    warning('Weird measurement time must be positive integer');
    return
elseif ceil(ExpSetup.MeasurementTime) ~= fix(ExpSetup.MeasurementTime)
    warning('Weird measurement time must be positive integer');
    return
elseif ExpSetup.MeasurementTime < 0
    warning('Weird measurement time must be positive integer');
    return
end

%% check stimulation ones - can still set it such that it never happens though

if StimMode % only check stim stuff if we are in stimmode
    
    if isnumeric(ExpSetup.StimulatorTriggerTime) ~= 1
        warning('Weird StimulatorTriggerTime must be positive integer');
        return
    elseif ceil(ExpSetup.StimulatorTriggerTime) ~= fix(ExpSetup.StimulatorTriggerTime)
        warning('Weird StimulatorTriggerTime must be positive integer');
        return
    elseif ExpSetup.StimulatorTriggerTime < 0
        warning('Weird StimulatorTriggerTime must be positive integer');
        return
    end
    
    if isnumeric(ExpSetup.StimulatorTriggerOffset) ~= 1
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    elseif ceil(ExpSetup.StimulatorTriggerOffset) ~= fix(ExpSetup.StimulatorTriggerOffset)
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    elseif ExpSetup.StimulatorTriggerOffset < 0
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    end
    
    if isnumeric(ExpSetup.StimulatorPulseWidth) ~= 1
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    elseif ceil(ExpSetup.StimulatorPulseWidth) ~= fix(ExpSetup.StimulatorPulseWidth)
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    elseif ExpSetup.StimulatorPulseWidth < 0
        warning('Weird StimulatorTriggerOffset must be positive integer');
        return
    end
    
    
    % voltage bits - check inputs are legit
    if isnumeric(ExpSetup.StimulatorWiperSetting) ~= 1
        warning('Weird StimulatorWiperSetting must be positive integer');
        return
    elseif ceil(ExpSetup.StimulatorWiperSetting) ~= fix(ExpSetup.StimulatorWiperSetting)
        warning('Weird StimulatorWiperSetting must be positive integer');
        return
    elseif ExpSetup.StimulatorWiperSetting < 0
        warning('Weird StimulatorWiperSetting must be positive integer');
        return
    end
    
    if isnumeric(ExpSetup.StimulatorVoltage) ~= 1
        warning('Weird StimulatorWiperSetting must be positive integer');
        return
    elseif ExpSetup.StimulatorVoltage < 0
        warning('Weird StimulatorWiperSetting must be positive number');
        return
    end
    
    %then see if they match - setting new value for wiper if they dont 
    
    [Rnew,Vnew]=ScouseTom_ard_getwipersetting(ExpSetup.StimulatorVoltage);
    
    if Rnew ~= ExpSetup.StimulatorWiperSetting
       stimwarn= sprintf('Voltage settings DO NOT MATCH! \n Recalculated Vstim is %.3f and Rpot is %d',Vnew,Rnew);
        warning(stimwarn);
        ExpSetup.StimulatorVoltage=Vnew;
        ExpSetup.StimulatorWiperSetting=Rnew;
    end  
    
    if ExpSetup.StimulatorTriggerTime > ExpSetup.MeasurementTime
        warning('StimulationTime is greater than measurement time');
        return
    end
    
    if ExpSetup.MeasurementTime < ExpSetup.StimulatorTriggerOffset
        warning('Trigger offset is greater than measurement time');
        return
    end
    
    
end


%% timing and protocol ones

if size(ExpSetup.Protocol,2) ~= 2
    warning('Weird protocol vector');
    return
end

if max(max(ExpSetup.Protocol)) > ExpSetup.Elec_num
    warning('Number of electrodes lower than the maximum channel');
end

if ExpSetup.MeasurementTime < .5
    warning('Injection time too small');
    return
elseif ExpSetup.MeasurementTime < 3
    warning('You might be cutting it a bit fine with the injection time!');
end

if ExpSetup.ContactCheckInjectTime < 1
    warning('ContactImpedanceTime time too small');
    return
elseif ExpSetup.ContactCheckInjectTime < 5
    warning('You might be cutting it a bit fine with the ContactImpedanceTime !');
end


%% check amp and freqs for 60601

ampok=checkIEC60601(ExpSetup.Amp,ExpSetup.Freq);

if ampok
    goodnessflag=1;
else
    warning('AMP AND FREQ TOO HIGH FOR HUMAN STUDIES! CARRYING ON ANYWAY...')
end




%% print the expsetup
fprintf('##################################\n');
fprintf('ExpSetup - Settings File for ScouseTom System!\n');


fprintf('Description of this file : %s\n',ExpSetup.Info.Desc');
fprintf('Created at the auspicious time of : %s\n',ExpSetup.Info.DateStr);
fprintf('--------------\n');


if SingleFreqMode %simpler output for singlefreqmode
    fprintf('System in "SingleFreqMode" - single amp and freq, running continuously\n');
    fprintf('Amplitude: %d uA\n',ExpSetup.Amp(1));
    fprintf('Frequency: %d Hz\n',ExpSetup.Freq(1));
else
    fprintf('System in "MultiFreqMode" - %d frequencies, randomised for each protocol line\n',N_freq);
    fprintf('Amplitudes uA: ');
    
    for i=1:N_amp-1
        fprintf('%d, ',ExpSetup.Amp(i));
    end
    fprintf('%d \n',ExpSetup.Amp(N_amp));
    
    fprintf('Frequencies Hz: ');
    
    for i=1:N_amp-1
        fprintf('%d, ',ExpSetup.Freq(i));
    end
    fprintf('%d \n',ExpSetup.Freq(N_freq));
end

fprintf('Protocol loaded was %s with %d lines \n',ExpSetup.ProtocolName,N_prt);
fprintf('Sources\tSinks\n');
fprintf('%d\t%d\n',ExpSetup.Protocol(:,1),ExpSetup.Protocol(:,2));

fprintf('--------------\n');
fprintf('Number of repeats : %d \n',ExpSetup.Repeats);

if SingleFreqMode
    
    fprintf('Injection time per protocol line : %d ms or %.2f s\n',ExpSetup.MeasurementTime, ExpSetup.MeasurementTime/1000);
    
else
    fprintf('Injection time per frequency per protocol line : %d ms or %.2f s\n',ExpSetup.MeasurementTime, ExpSetup.MeasurementTime/1000);
end

fprintf('Estimated time to complete measurements :');

if ExpSetup.TotalTime < 60
    fprintf(' %.2f sec \n',ExpSetup.TotalTime);
else if ExpSetup.TotalTime < 3600
        fprintf(' %.2f min \n',ExpSetup.TotalTime/60);
    else
        fprintf(' %.2f hours \n',ExpSetup.TotalTime/3600);
    end
end
fprintf('--------------\n');


if StimMode
    fprintf('Stimulation Mode is ON! - Randomised phase delay triggered by phase marker on Keithley\n');
    fprintf('%d uS pulse triggered every %d ms with offset %d ms from channel switch\n',ExpSetup.StimulatorPulseWidth,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset);
    fprintf('Approx %d stims per injection\n',floor((ExpSetup.MeasurementTime-ExpSetup.StimulatorTriggerOffset)/ExpSetup.StimulatorTriggerTime));
    fprintf('Stimulation Voltage is %.2f V for a potentiomter setting of %d\n',ExpSetup.StimulatorVoltage,ExpSetup.StimulatorWiperSetting);
end

fprintf('##################################\n');





end

%%
function [ok]=checkIEC60601(Amp,Freq)
%checks if too high current for any of the frqs

Freq_khz=Freq*1000;

Amp_rms=sqrt(2)*Amp;
Amp_max=sqrt(2)*100*Freq_khz;

ok=all(Amp_rms < Amp_max);





end

