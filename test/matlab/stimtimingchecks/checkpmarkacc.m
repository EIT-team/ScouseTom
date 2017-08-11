nseg = 200; % number of segments
fname = 'scope_1.bin';

[x,~]=importAgilentBin(fname,1);
dT=mean(diff(x));
Fs=1/dT;
nsamples=length(x);
Fc=6000;
T=1/Fc;

SamplesCyles= T/dT;
PhasePerSample= 360/SamplesCyles;

%%
y1=nan(nsamples,nseg);
y1_mod=y1;
y1_pha=y1;
y2=y1;
y3=y1;

% load the sine wave
for iSeg = 1: nseg
    [x,y1(:,iSeg)]=importAgilentBin(fname,iSeg);
    y1=detrend(y1,'constant');
    y1_mod(:,iSeg)=abs(hilbert(y1(:,iSeg)));
    y1_pha(:,iSeg)=angle(hilbert(y1(:,iSeg))); 
end

for iSeg = 1: nseg
    [x,y2(:,iSeg)]=importAgilentBin(fname,iSeg+nseg);
end

for iSeg = 1: nseg
    [x,y3(:,iSeg)]=importAgilentBin(fname,iSeg+2*nseg);
end

[b,a]=fir1(40,0.1);
y1_pha=filtfilt(b,a,y1_pha);
y1_pha=filtfilt(b,a,y1_pha);
%%
figure;
hold on
plot(x,y1,'b');
plot(x,y2,'r');
plot(x,y3,'k');
hold off
%% find phase at point of stim trigs

trig_idx = find(x>0,1);
phase_trig=rad2deg((y1_pha(trig_idx,:)))';

%% find nearest phasemarker

pmark_idx=nan(nseg,1);
phase_pmark=nan(nseg,1);
for iSeg = 1: nseg
    BelowThres=(y3(:,iSeg) < 0.05);
    [S, NN]=bwlabel(BelowThres);
    pmark_idx(iSeg) =find(S == NN,1); % take the first sample of the last pmark
    phase_pmark(iSeg)=rad2deg(y1_pha(pmark_idx(iSeg),iSeg));
end

phase_eff=phase_trig-phase_pmark;

ysumsub=y1;

if phase_eff(1) > 120
    disp('Ignoring first trigger as was not first in sequence');
    phase_eff(1)=[];
    ysumsub(:,1)=[];
    
end
if phase_eff(end) < 120
    disp('ignoring last trigger as it did have a pair');
    phase_eff(end)=[];
    ysumsub(:,end)=[];
end

npairs=length(phase_eff)/2;

phase_diff=nan(npairs,1);

ysub=nan(nsamples,npairs);
yadd=ysub;

icnt=1;
for iseg=1:2:length(phase_eff)
    phase_diff(icnt)=phase_eff(iseg+1)-phase_eff(iseg);

    %pretend summation subtraction
    ysub(:,icnt)=ysumsub(:,iseg)-ysumsub(:,iseg+1);
    yadd(:,icnt)=ysumsub(:,iseg)+ysumsub(:,iseg+1);
    
    icnt=icnt+1;
end
%%
phase_error=phase_diff -180;
phase_error_samples=phase_error/PhasePerSample;
phase_error_time=phase_error_samples*dT;

ysub_cor=nan(nsamples,npairs);
yadd_cor=ysub;

figure
hold on
icnt=1;
for iseg=1:2:length(phase_eff)
    
    
    y_phase=ysumsub(:,iseg);
    y_antiphase=ysumsub(:,iseg+1);
    
   
    
    y_antiphase=circshift(y_antiphase,10+round(phase_error_samples(icnt)),1);
    
    plot(y_phase,'b')
    plot(y_antiphase,'r')
    
    
    %pretend summation subtraction
    ysub_cor(:,icnt)=y_phase-y_antiphase;
    yadd_cor(:,icnt)=y_phase+y_antiphase;
    icnt=icnt+1;
    
end

hold off

%%
figure
subplot(2,1,1)
hold on
plot(ysub_cor,'b')
plot(ysub,'r')
hold off

subplot(2,1,2)
hold on
plot(yadd_cor,'b')
plot(yadd,'r')

hold off
ylim([-1 1]*0.05)





