function [ out,Cycles ] = ScouseTom_cycles2ms( in,Cycles,OffsetStartandEnd )
%ScouseTom_cycles2ms Converts number of cycles for each Frequency to
%injection time in ms, given stand and end delays. Cycles can be single or
%vector
%   Input:
%
%   Output:
%   InjectionTimes - array of ms rounded up to nearest ms


if nargin <3
    error('not enough inputs');
end

% user can input either vector of freqs or ExpSetup
if isstruct(in)
    
    if isfield(in,'Freq');
        Freqs=in.Freq;
        
    else
        error('No Frequencies given in ExpSetup!');
    end
else
    if isnumeric(in)
        
        Freqs=in;
    else
        error('wierd input');
    end
end



if length(Cycles) ==1;
    Cycles=repmat(Cycles,size(Freqs));
end

T=(1./Freqs)*1000; %Period in ms
InjectionTimes=ceil(T.*Cycles + OffsetStartandEnd + OffsetStartandEnd);

if isstruct(in)
    in.MeasurementTime=InjectionTimes;
    in.Info.Inj_Cycles=Cycles;
    in.Info.Inj_Cycles_Offset=OffsetStartandEnd;
    in.Info.Inj_Define_ms=0;
    out=in;
else
    out=InjectionTimes;
end






end

