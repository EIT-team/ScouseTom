
for iPrt = 1:20
    
     n = [1];
     n2 = [2];
     for j = 1:length(n)
        ExpSetup_nostim.Protocol(n(j),1:4) = Protocol(iPrt,1:4);
        ExpSetup_nostim.Protocol(n(j),5:8) = Protocol(iPrt,5:8);
        ExpSetup_nostim.Protocol(n2(j),1:4) = Protocol(iPrt,5:8);
        ExpSetup_nostim.Protocol(n2(j),5:8) = Protocol(iPrt,1:4);
     end
    
    [ Ard,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard,ExpSetup_nostim);
    [  Ard,ExpSetup] = ScouseTom_Start_no_stim( Ard,ExpSetup_nostim,iPrt,1);
    
 %%   
    
     n = [1,3,5,7];
     n2 = [2,4,6,8];
     for j = 1:length(n)
        ExpSetup_stim.Protocol(n(j),1:4) = Protocol(iPrt,1:4);
        ExpSetup_stim.Protocol(n(j),5:8) = Protocol(iPrt,5:8);
        ExpSetup_stim.Protocol(n2(j),1:4) = Protocol(iPrt,5:8);
        ExpSetup_stim.Protocol(n2(j),5:8) = Protocol(iPrt,1:4);
    end
    
    
    [ Ard,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard,ExpSetup_stim);
    [  Ard,ExpSetup] = ScouseTom_Start_stim( Ard,ExpSetup_stim,iPrt,1);
    
    disp(['Prt' num2str(iPrt) 'finished']);
    
    
end