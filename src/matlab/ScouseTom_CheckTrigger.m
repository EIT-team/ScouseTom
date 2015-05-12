function [ S,CurrentSource,ExpSetup ] = ScouseTom_CheckTrigger( S,CurrentSource,ExpSetup )
%UNTITLED2 jsut starts the trigger going to make sure all is well
%   Detailed explanation goes here


TotalTime=100;

%% START TRIGGER MOFO

 %start arduino going
        fprintf(S,'S');
        
        %start timer
        tstart=tic;
        elapsedtime=0;
        
        % create box for stopping early
        FS = stoploop('Trigger Is Running. Hit OK To stop early');
        
        
        
        while(~FS.Stop() &&  elapsedtime < TotalTime)
            elapsedtime=toc(tstart);
                      
        end
        
        FS.Clear();
        
 
    %Stop injecting and pause before changing Frequency/Amplitude



fprintf(S,'H');



end

