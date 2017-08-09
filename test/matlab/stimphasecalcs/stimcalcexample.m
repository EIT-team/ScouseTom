

mintime = 1; % time in microseconds each tick takes

% StimOffset =[10 20];
F= 100:1:12000;

StimOffset =10;
% F=6000;

for iStim = 1:length(StimOffset)
    
    StimSeq = [0,180]+StimOffset(iStim);
    
    

    for iFreq = 1:length(F)
        
        Fc = F(iFreq);
        
        T = 1000000 / Fc; %period in microseconds
        phaseacc = T / 360; %microseconds per degree of phase
        
        timetarget = phaseacc*StimSeq;
        
        ticks=double(int32((timetarget/mintime)));
        
        timeactual=ticks*mintime;
        
        phaseactual = timeactual/T *360;
        
        phaseerror(iStim,iFreq)=(180-diff(phaseactual));
        
        timeerror(iStim,iFreq)=(diff(timetarget)-diff(timeactual));
        
    end
    
end

plot(F,timeerror)