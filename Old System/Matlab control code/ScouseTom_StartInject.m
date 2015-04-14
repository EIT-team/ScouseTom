function [ S,CurrentSource,ExpSetup ] = ScouseTom_StartInject( S,CurrentSource,ExpSetup )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

Ampl=ExpSetup.Ampl;
Freq=ExpSetup.Freq;
TotalTime=ExpSetup.TotalTime;
ProtocolTime=ExpSetup.ProtocolTime;

 %% Prompt user to start current injection


fprintf(CurrentSource, 'DISP:TEXT "Waiting to Go"');
fprintf(CurrentSource, 'DISP:WIND2:TEXT "Twiddling Thumbs"');

%Ask user if they want to continue/cancel.
%Opens a dialog, and compares the output to 'Start'. If start has been pressed, script
%continues. If 'Cancel' is pressed, script ends.
if isequal(questdlg('Press Start To Begin Protocol Injection. BIOSEMI SHOULD BE RECORDING BEFORE YOU HIT GO!','title','Start','Cancel','Start'),'Start')
else
    fprintf(CurrentSource, 'DISP:TEXT "Injection Cancelled"');
    pause(1)
    fprintf(CurrentSource, 'SYST:PRES');
    fclose(S);
    clear('S');
    error('User Canceled Operation');

end


fprintf(CurrentSource, 'DISP:TEXT "ITS GO TIME"');


CSScrolltext(CurrentSource,'LETS DO THIIIIIIIIIIIISSSS!!!!!',2);

fprintf(CurrentSource,'DISP:WIND2:TEXT "GO! GO! GO!"');

%% Start measurement

%timestamp this data
NInj=size(ExpSetup.Timestamps.InjStarts,1);
ExpSetup.Timestamps.InjStarts(NInj+1)=now;




for aa = 1:length(Freq)
    for bb = 1:length(Ampl)
        
        %Set Frequency and Amplitude of Current Source
        
        fprintf(CurrentSource, 'SOUR:CURR:COMP 1.9');
        
        eval(['fprintf(CurrentSource, ''SOUR:WAVE:FREQ ',num2str(Freq(aa)), ''')' ]);
        eval(['fprintf(CurrentSource, ''SOUR:WAVE:AMPL ',num2str(Ampl(bb)), ''')' ]);
        fprintf(CurrentSource, 'SOUR:WAVE:ARM');
        fprintf(CurrentSource, 'SOUR:WAVE:INIT');
        
        eval(['fprintf(CurrentSource, ''DISP:TEXT "',num2str(Ampl(bb)*1E6,4),'uA @ ', num2str(Freq(aa)/1000,3),'kHz" '')' ]);
        
        %Turn on Current Source Injection
        fprintf(CurrentSource, 'SOUR:WAVE:ARM');
        fprintf(CurrentSource, 'SOUR:WAVE:INIT');
        
        
        
        %just make sure the current source is on
        pause(0.1);
        disp('INJECTING NOW');
        
        
        elapsedtime=0;
        repnum=0;
        %start arduino going
        fprintf(S,'S');
        
        %start timer
        tstart=tic;
        
        fprintf(CurrentSource,['DISP:WIND2:TEXT "Complete Protocols: ', num2str(repnum) ,'"']);
        
        % create box for stopping early
        FS = stoploop('Current Injection Protocol is running. Hit OK To stop early');
        
        
        
        while(~FS.Stop() &&  elapsedtime < TotalTime)
            elapsedtime=toc(tstart);
            
            tmp=floor(elapsedtime/ProtocolTime);
            if tmp ~= repnum
                repnum=tmp;
                fprintf(CurrentSource,['DISP:WIND2:TEXT "Completed Protocols: ', num2str(repnum) ,'"']);
                disp(['Approx number of completed protocols : ', num2str(repnum)]);
            end
            
        end
        
        FS.Clear();
        
    end
    %Stop injecting and pause before changing Frequency/Amplitude
    fprintf(CurrentSource, 'SOUR:WAVE:ABOR');
    
    %     pause(StartDelay);
    
end


fprintf(S,'H');

msgbox('All done! Stop Biosemi Recording Now!','Woohoo!')
fprintf(CurrentSource, 'SOUR:WAVE:ABOR');
fprintf(CurrentSource, 'DISP:TEXT "Injection Finished"');
fprintf(CurrentSource, 'DISP:WIND2:TEXT "Woohoo! :D"');
pause(2)
fprintf(CurrentSource, 'SYST:PRES');

%% save expinfo again

fname=fullfile(ExpSetup.dname,'ExperimentInfo.mat');

save(fname,'ExpSetup');



end

