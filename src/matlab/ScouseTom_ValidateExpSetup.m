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


%% check if too many freqs or too long protocol
%current set manually in arduino code to 200 and 40 as variables
%maxInjections and maxFreqs

maxInjections = 200;
maxFreqs = 40;

if N_prt > maxInjections
    error(['Protocol is too long - max is ', num2str(maxInjections)]);
end

if N_freq > maxFreqs
    error(['Too many freqs - max is ', num2str(maxFreqs)]);
end

%% check if the fields are actually there

%legit_fields={'Amp', 'Freq', 'Protocol','Elec_num', 'MeasurementTime',...
%    'Repeats','StimulatorTriggerTime','StimulatorTriggerOffset',...
%    'StimulatorPulseWidth','ContactCheckInjectTime','ProtocolName',...
%    'StimulatorVoltage','StimulatorWiperSetting'};

legit_fields={'Amp', 'Freq', 'Protocol','Elec_num', 'MeasurementTime',...
    'Repeats','StimulatorTriggerTime','StimulatorTriggerOffset',...
    'StimulatorPulseWidth','ContactCheckInjectTime','StimulatorVoltage'};

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
    
    if  isfield(ExpSetup.Info,'StimulatorWiperSetting'); %if wiper setting is given
        
        if isnumeric(ExpSetup.Info.StimulatorWiperSetting) ~= 1
            warning('Weird StimulatorWiperSetting must be positive integer');
            return
        elseif ceil(ExpSetup.Info.StimulatorWiperSetting) ~= fix(ExpSetup.Info.StimulatorWiperSetting)
            warning('Weird StimulatorWiperSetting must be positive integer');
            return
        elseif ExpSetup.Info.StimulatorWiperSetting < 0
            warning('Weird StimulatorWiperSetting must be positive integer');
            return
        end
        
    end
    
    
    if isnumeric(ExpSetup.StimulatorVoltage) ~= 1 %if check target voltage is ok
        warning('Weird StimulatorWiperSetting must be positive integer');
        return
    elseif ExpSetup.StimulatorVoltage < 0
        warning('Weird StimulatorWiperSetting must be positive number');
        return
    end
    
    %then see if they match - setting new value for wiper if they dont
    [Rnew,Vnew]=ScouseTom_ard_getwipersetting(ExpSetup.StimulatorVoltage);
    
    if Rnew ~= ExpSetup.Info.StimulatorWiperSetting
        stimwarn= sprintf('Voltage settings DO NOT MATCH! \n Recalculated Vstim is %.3f and Rpot is %d',Vnew,Rnew);
        warning(stimwarn);
        ExpSetup.StimulatorVoltage=Vnew;
        ExpSetup.Info.StimulatorWiperSetting=Rnew;
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


%remove Bad electrodes from Protocol if any are set - create variable of
%"full" protocol first

if (isfield(ExpSetup,'Bad_Elec')) %if the field exists
    if ~isempty(ExpSetup.Bad_Elec) % and some bad ones have been enterred
        
        if isfield(ExpSetup.Info,'Protocol_Full') %if this is not the first time elecs have been removed from this protocol
            ExpSetup.Protocol=ExpSetup.Info.Protocol_Full; % retreve the unedited version
        else
            ExpSetup.Info.Protocol_Full=ExpSetup.Protocol; % store the un edited version
        end
        
        %find any proctol lines which include the bad elecs
        rem_idx=any(ismember(ExpSetup.Protocol,ExpSetup.Bad_Elec),2);
        rem_idx=find(rem_idx);
        
        %store rem idx and update size of prt
        ExpSetup.Protocol(rem_idx,:)=[];
        ExpSetup.Info.rem_idx=rem_idx;
        N_prt = size(ExpSetup.Protocol,1);
        
        warning([ num2str(length(rem_idx))  ' LINES REMOVED DUE TO BAD ELECS']);
    else
        % if we have run the bad elec removal before, but now there are
        % none to remove, so take the full protocol again
        if isfield(ExpSetup.Info,'Protocol_Full')
            ExpSetup.Protocol=ExpSetup.Info.Protocol_Full;
            ExpSetup.Info=rmfield(ExpSetup.Info,{'rem_idx','Protocol_Full'}); %remove references to bad elecs
            
        else
            %ExpSetup.Info.Protocol_Full=ExpSetup.Protocol;
            %otherwise save the full protocol variable
        end
        
    end
    
else
    
    % if user deleted the variable Bad_Elec then retreive the old procool
    
    % if we have run the bad elec removal before, but now there are
    % none to remove, so take the full protocol again
    if isfield(ExpSetup.Info,'Protocol_Full')
        ExpSetup.Protocol=ExpSetup.Info.Protocol_Full;
        ExpSetup.Info=rmfield(ExpSetup.Info,{'rem_idx','Protocol_Full'}); %remove references to bad elecs
    else
        %ExpSetup.Info.Protocol_Full=ExpSetup.Protocol;
        %otherwise save the full protocol variable
    end
    
end




%% check amp and freqs for 60601

ampok=checkIEC60601(ExpSetup.Amp,ExpSetup.Freq);

if ampok
    goodnessflag=1;
else
    warning('AMP AND FREQ TOO HIGH FOR HUMAN STUDIES! CARRYING ON ANYWAY...')
    msgbox('Exceeding IEC60601. Are you sure? Will carry on for now','Too high current?','warn');
end

%% Check if we need to calculate more measurement times

if ExpSetup.Info.Inj_Define_ms ==1
    
    disp('Injection time defined by milliseconds');
    
    %if we are defining measurement time by milliseonds then check correct
    %number is there and calc new cycles eq
    
    if N_freq == size(ExpSetup.MeasurementTime,1)
        %if one given for each one then use those
        ExpSetup.Info.Inj_Cycles=ScouseTom_ms2cycles(ExpSetup.Freq,ExpSetup.MeasurementTime);
        ExpSetup.Info.Inj_Cycles_Offset=0;
    elseif size(ExpSetup.MeasurementTime,1) ==1
        %if user has only given 1 then duplicate this for all of them
        [Cycles,Meas]=ScouseTom_ms2cycles(ExpSetup.Freq,ExpSetup.MeasurementTime); % give equivalent cycles - this also makes Meas a vector
        ExpSetup.MeasurementTime=Meas;
        ExpSetup.Info.Inj_Cycles=Cycles;
        ExpSetup.Info.Inj_Cycles_Offset=0;
    else
        %otherwise its ambigusou so fuck off
        error('Number of Measurement Times does not match number of frequencies: please put 1 or NFreq');
    end
    
else
    % we are using number of cycles to calculate the measurement time
    disp('Injection time defined by Number of Cycles');
    
    if (N_freq == size(ExpSetup.Info.Inj_Cycles,1)) || (size(ExpSetup.Info.Inj_Cycles,1) == 1)
        
        [Meas,Cycles]=ScouseTom_cycles2ms(ExpSetup.Freq,ExpSetup.Info.Inj_Cycles,ExpSetup.Info.Inj_Cycles_Offset);
        ExpSetup.MeasurementTime=Meas;
        ExpSetup.Info.Inj_Cycles=Cycles;
    else
        error('Number of Inj Cycles does not match number of frequencies: please put 1 or NFreq');
        
    end
    
    
end




meas_temp=ScouseTom_cycles2ms(ExpSetup.Freq,ExpSetup.Info.Inj_Cycles,ExpSetup.Info.Inj_Cycles_Offset);

if ~all(meas_temp == ExpSetup.MeasurementTime)
    warning('Measurement time and Cycles variables dont match - keeping Measurement time!!!');
    ExpSetup.Info.Inj_Cycles_Offset=0;
    ExpSetup.Info.Inj_Cycles=ScouseTom_ms2cycles(ExpSetup.Freq,ExpSetup.MeasurementTime);
    ExpSetup.Info.Inj_Define_ms=1;
end





%% Update Info Struct

%user can edit ExpSetup on the Fly, so make sure ExpSetup.Info relates to
%the ExpSetup as it ACTUALLY IS

ExpSetup.Info.ProtocolLength=N_prt;
ExpSetup.Info.FreqNum=N_freq;
ExpSetup.Info.ProtocolTime=sum(N_prt*(ExpSetup.MeasurementTime/1000)); %time in seconds for one complete protocol
ExpSetup.Info.TotalTime=ExpSetup.Repeats*ExpSetup.Info.ProtocolTime;




%write debug string
ExpSetup.Info.DebugString=ScouseTom_debugstring(ExpSetup);





%% print the expsetup
fprintf('########');
fprintf('Validating Settings File for ScouseTom System!');
fprintf('########\n');

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

fprintf('Protocol loaded was %s with %d lines \n',ExpSetup.Info.ProtocolName,N_prt);
fprintf('Sources\tSinks\n');
fprintf('%d\t\t%d\n',ExpSetup.Protocol(:,1),ExpSetup.Protocol(:,2));

fprintf('--------------\n');
fprintf('Number of repeats : %d \n',ExpSetup.Repeats);

if SingleFreqMode
    
    fprintf('Injection time per protocol line : %d ms or %.2f s\n',ExpSetup.MeasurementTime, ExpSetup.MeasurementTime/1000);
    
else
    for i=1:N_amp
        fprintf('Injection time for Freq %d: %d Hz: %d ms or %d cycles\n',i,ExpSetup.Freq(i),ExpSetup.MeasurementTime(i), ExpSetup.Info.Inj_Cycles(i));
    end
end



fprintf('Estimated time to complete measurements :');

if ExpSetup.Info.TotalTime < 60
    fprintf(' %.2f sec \n',ExpSetup.Info.TotalTime);
else if ExpSetup.Info.TotalTime < 3600
        fprintf(' %.2f min \n',ExpSetup.Info.TotalTime/60);
    else
        fprintf(' %.2f hours \n',ExpSetup.Info.TotalTime/3600);
    end
end



if StimMode
    fprintf('--------------\n');
    
    fprintf('Stimulation Mode is ON! - Randomised phase delay triggered by phase marker on Keithley\n');
    fprintf('%d uS pulse triggered every %d ms with offset %d ms from channel switch\n',ExpSetup.StimulatorPulseWidth,ExpSetup.StimulatorTriggerTime,ExpSetup.StimulatorTriggerOffset);
    fprintf('Approx %d stims per injection\n',floor((ExpSetup.MeasurementTime(1)-ExpSetup.StimulatorTriggerOffset)/ExpSetup.StimulatorTriggerTime));
    fprintf('Stimulation Voltage is %.2f V for a potentiomter setting of %d\n',ExpSetup.StimulatorVoltage,ExpSetup.Info.StimulatorWiperSetting);
end

fprintf('########EVERYTHING IS OK!!##########\n');





end

%%
function [ok]=checkIEC60601(Amp,Freq)
%checks if too high current for any of the frqs

Freq_khz=Freq*1000;

Amp_rms=sqrt(2)*Amp;
Amp_max=sqrt(2)*100*Freq_khz;

ok=all(Amp_rms < Amp_max);





end


