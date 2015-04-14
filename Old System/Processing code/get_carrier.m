function [ Fc ] = get_carrier( data,Fs )
%get carrier frequency of data
% Assumes only one carrier frequency 
%   finds the largest frequency bin in a data set. Zero pads the result to
%   give smaller frequency bins for short signals for a more accurate
%   result.
% Adapted from G Dragons Code by the sonorous and majestic Jimmy




%find spectrum of signal with no overlaps or windowing
    [Pxx,w] = pwelch(detrend(data),[],0,2^16,Fs);
    % find the largest bunch
    w_ind = find(w>105);
    %find the biggest one
    [~,maxw] = max(Pxx(w_ind));
    %find carrier one
    Fc = w(w_ind(maxw));
    %display message to user
   fprintf('Carrier frequency detected: Fc = %.2f Hz\r',Fc);    
    
end

