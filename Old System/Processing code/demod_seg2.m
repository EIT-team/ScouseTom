function [ Vdemod ] = demod_seg2( Vseg,Fs,N_prt,N_elec,N_rep,varargin )
%segment_ind demodulates each segment
%   Detailed explanation goes here

%% data info

% N_elec=size(Vseg,3);
% N_prt=size(Vseg,1);
% N_rep=size(Vseg,4);




%% demodulate data

Vdemod=nan(size(Vseg));



%find carrier on first injection (this is to prevent problems with channels
%with low SNR (getting wrong carrier)

if isempty(varargin) == 1
    disp('No filter coefs specified, using defaults');
    Fc=get_carrier(Vseg(1,:,1,1),Fs);
    Nord=5;
    bandwidth=100;
    [B,A] = butter(Nord,(Fc+[-bandwidth/2,bandwidth/2])./(Fs/2));
elseif numel(varargin) ==2
    B=varargin{1};
    A=varargin{2};
else
  error('wrong number of filter coefs');
end



%demod each segment
for iPrt=1:N_prt
    iElec=1;
    for iElec=1:N_elec
        iRep=1;
        for iRep=1:N_rep
            Vdemod(iPrt,:,iElec,iRep)=demod_hilbert2(Vseg(iPrt,:,iElec,iRep),B,A);
        end
    end
end

disp('Demodulation done');


end

