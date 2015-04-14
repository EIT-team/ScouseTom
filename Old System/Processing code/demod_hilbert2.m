function [ data_demod ] = demod_hilbert2( data,B,A)
%demod_hilbert - filters and demodulates data using hilbert transform
%method. Slight modification of G-Dragons code get_BV2
%   Inputs:
%   Data- signal to be demodulated
%   Fs - sampling rate of data
% Fc - carrier frequency
% optional
% BW - bandwidth of filter
% Nord - order of filter


if any(isnan(data))
    data_demod = nan;
    
%     warning('Nans in data bro!');
else
     
    
    %filter data using coefs
    data_demod = filtfilt(B,A,data);
    %get envelope of signal using hilbert transform
    data_demod = abs(hilbert(data_demod));
    
    
    
end

end

