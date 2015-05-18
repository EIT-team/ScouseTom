function [ InjectionTimes ] = ScouseTom_cycles2ms( Freqs,Cycles,OffsetStart,OffsetEnd )
%ScouseTom_cycles2ms Converts number of cycles for each Frequency to
%injection time in ms, given stand and end delays. Cycles can be single or
%vector
%   Input:
%
%   Output:
%   InjectionTimes - array of ms rounded up to nearest ms

if length(Cycles) ==1;
    Cycles=repmat(Cycles,size(Freqs));
end

T=(1./Freqs)*1000; %Period in ms
InjectionTimes=T.*Cycles + OffsetStart + OffsetEnd;

end

