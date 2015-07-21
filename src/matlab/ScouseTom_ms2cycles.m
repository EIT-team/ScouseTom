function [ Cycles ] = ScouseTom_ms2cycles( Freqs,Meas)
%ScouseTom_ms2cycles Converts injection time in ms, for each Frequency to
%number of cyclesv can be single or
%vector
%   Input:
%
%   Output:
%   Cycles - array of Cycles of sine wave corresponding to given Meas times

if length(Meas) ==1;
    Meas=repmat(Meas,size(Freqs));
end

T=(1./Freqs)*1000; %Period in ms

Cycles=Meas./T; %number of cycles


end

