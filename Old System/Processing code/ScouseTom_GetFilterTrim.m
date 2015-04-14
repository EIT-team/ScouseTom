function [ trim_demod, B,A,Fc ] = ScouseTom_GetFilterTrim( Vseg,Fs,plotflag )
%ScouseTom_GetFilterTrim Gets optimal filter parameters and samples to trim
%   based on SNR tests for different windows
% from the dexterous exploratory hands of jimmy

%get carrier frequency
Fc=get_carrier(Vseg,Fs);

%give explicitly
% Fc=10;


%get number of samples in segment
Nsamples=length(Vseg);

%trim max is 25% of signal - to give 50% for the average
trim_max=ceil(0.25*Nsamples);


Decay_coef=0.00001; %amount filter ripple must decay by before using data


BW=50; %bandwidth of filters



%% choose filter


%from TestFilterSNR - FIR outperforms IIR until around 1100 samples, then
%they are within 1% of each other. IIR is MUCH faster than high order FIR
%so use this to speed up the process

if trim_max <1200
    
    if (Fc - BW/2) > 0
        
        [B,A]=fir1(trim_max,(Fc+[-BW/2,BW/2])./(Fs/2),'bandpass',window(@blackmanharris,trim_max+1));
    else
        [B,A]=fir1(trim_max,(Fc+Fc/2)./(Fs/2),'low',window(@blackmanharris,trim_max+1));
    end
    
    trim_demod=trim_max;
    if plotflag ==1;
        figure;
        impz(B,A);
        figure;
        freqz(B,A);
    end
    disp('FIR with Blackman-Harris Window used');
else
    
    %otherwise use the 3rd order one
    
    Nord=3; %order of the filter
    
    %make butterworth filter
    
    if (Fc - BW/2) > 0
        
        [B,A] = butter(Nord,(Fc+[-BW/2,BW/2])./(Fs/2));
        
    else
        [B,A] = butter(2,(Fc+[-5,5])./(Fs/2));
    end
    
    
    
    %get filter response and estimate when to chop data
    [H, T]= impz(B,A,fix(Nsamples));
    [maxh, ih]=max(abs(H));
    
    %linear fit of the exponetial decay - when it reaches certain percentage of max
    Htofit=log(abs(H(ih:end)./maxh));
    % figure;plot(T(ih:end),Htofit)
    P=polyfit(T(ih:end),Htofit,1);
    decay_samples=ceil(log(Decay_coef)/P(1));
    
    %total amount to trim is decay time plus time to max
    trim_demod=decay_samples+ih;
    
    %if this trim amount is to great set it to trim_max
    
    if trim_demod > trim_max
        trim_demod=trim_max;
    end
    
    
    if plotflag ==1;
        figure;
        impz(B,A)
        figure;
        freqz(B,A);
        
        
        figure;
        hold on
        plot(T,abs((H)))
        line([0 length(T)],[maxh*Decay_coef maxh*Decay_coef],'color','r');
        line([trim_demod trim_demod],[min(abs(H)) maxh],'color','k');
        line([trim_max trim_max],[min(abs(H)) maxh],'color',[0 0.5 0]);
        hold off
        title('impulse response of filter')
        set(gca,'Yscale','log');
    end
    disp('3rd Order Butterworth Filter Used');
    
    
end






end

