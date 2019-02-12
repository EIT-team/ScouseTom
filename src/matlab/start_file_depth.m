
for iPrt = 1:20
    fclose(Ard);
    
     [Ard] = ScouseTom_Init('COM3');
     
     pause(30);
    
     n = [1];
     n2 = [2];
     for j = 1:length(n)
        ExpSetup_d_nostim.Protocol(n(j),1:4) = Protocol(iPrt,1:4);
        ExpSetup_d_nostim.Protocol(n(j),5:8) = Protocol(iPrt,5:8);
        ExpSetup_d_nostim.Protocol(n2(j),1:4) = Protocol(iPrt,5:8);
        ExpSetup_d_nostim.Protocol(n2(j),5:8) = Protocol(iPrt,1:4);
     end
    
    [ Ard,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard,ExpSetup_d_nostim);
    pause(1);
    [  Ard,ExpSetup] = ScouseTom_Start_stim( Ard,ExpSetup_d_nostim,iPrt,0,1);
    pause(1);
    
 %%   
    
     n = [1,3,5,7];
     n2 = [2,4,6,8];
     for j = 1:length(n)
        ExpSetup_d_stim.Protocol(n(j),1:4) = Protocol(iPrt,1:4);
        ExpSetup_d_stim.Protocol(n(j),5:8) = Protocol(iPrt,5:8);
        ExpSetup_d_stim.Protocol(n2(j),1:4) = Protocol(iPrt,5:8);
        ExpSetup_d_stim.Protocol(n2(j),5:8) = Protocol(iPrt,1:4);
    end
    
    
    [ Ard,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard,ExpSetup_d_stim);
    pause(1);
    [  Ard,ExpSetup] = ScouseTom_Start_stim( Ard,ExpSetup_d_stim,iPrt,1,1);
    pause(3);
    
    disp(['Prt' num2str(iPrt) 'finished']);
    
    
end