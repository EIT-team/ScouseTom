

%%
for iPrt = 18:20
    
    fclose(Ard_d);
    fclose(Ard_c);
    
    [Ard_d] = ScouseTom_Init_Two_Ard('COM3');
    [Ard_c] = ScouseTom_Init_Two_Ard('COM4');
     n = [1];
     n2 = [2];
     for j = 1:length(n)
        ExpSetup_d_nostim.Protocol(n(j),1:4) = Protocol_d(iPrt,1:4);
        ExpSetup_d_nostim.Protocol(n(j),5:8) = Protocol_d(iPrt,5:8);
        ExpSetup_d_nostim.Protocol(n2(j),1:4) = Protocol_d(iPrt,5:8);
        ExpSetup_d_nostim.Protocol(n2(j),5:8) = Protocol_d(iPrt,1:4);
     end
    
 [ Ard_d,ExpSetup_d_nostim,OKFLAG ] = ScouseTom_SendSettings_4shunt(Ard_d,ExpSetup_d_nostim);
 
     n = [1];
     n2 = [2];
     for j = 1:length(n)
         ExpSetup_c_nostim.Protocol(n(j),1) = Protocol(iPrt,1);
        ExpSetup_c_nostim.Protocol(n(j),2) = Protocol(iPrt,2);
        ExpSetup_c_nostim.Protocol(n2(j),1) = Protocol(iPrt,2);
        ExpSetup_c_nostim.Protocol(n2(j),2) = Protocol(iPrt,1);
     end
     
    [ Ard_c,ExpSetup_c_nostim,OKFLAG ] = ScouseTom_SendSettings(Ard_c,ExpSetup_c_nostim);
  %% 
     [ Ard_d,ExpSetup_d_nostim, logfid_d_nostim, matlog_d_nostim ] = ScouseTom_StartFile_d( Ard_d,ExpSetup_d_nostim,iPrt, 0, 1);   
 [ Ard_c,ExpSetup_c_nostim, logfid_c_nostim, matlog_c_nostim ] = ScouseTom_StartFile_c( Ard_c,ExpSetup_c_nostim,iPrt, 0, 1);

    %%
    fprintf(Ard_d, 'M');
fprintf(Ard_c, 'M');

%%
fprintf(Ard_d, 'G');

[ Ard_d,Ard_c, ExpSetup_d_nostim, ExpSetup_c_nostim] = ScouseTom_Start_Two_Ard( Ard_d, Ard_c, ExpSetup_d_nostim, ExpSetup_c_nostim, logfid_d_nostim, matlog_d_nostim, logfid_c_nostim,1);

 %%   
    
     n = [1,3,5,7];
     n2 = [2,4,6,8];
     for j = 1:length(n)
        ExpSetup_d_stim.Protocol(n(j),1:4) = Protocol_d(iPrt,1:4);
        ExpSetup_d_stim.Protocol(n(j),5:8) = Protocol_d(iPrt,5:8);
        ExpSetup_d_stim.Protocol(n2(j),1:4) = Protocol_d(iPrt,5:8);
        ExpSetup_d_stim.Protocol(n2(j),5:8) = Protocol_d(iPrt,1:4);
     end
    
     
      [ Ard_d,ExpSetup_d_stim,OKFLAG ] = ScouseTom_SendSettings_4shunt(Ard_d,ExpSetup_d_stim);
      
      
      
       n = [1,3,5,7];
     n2 = [2,4,6,8];
     for j = 1:length(n)
         ExpSetup_c_stim.Protocol(n(j),1) = Protocol(iPrt,1);
        ExpSetup_c_stim.Protocol(n(j),2) = Protocol(iPrt,2);
        ExpSetup_c_stim.Protocol(n2(j),1) = Protocol(iPrt,2);
        ExpSetup_c_stim.Protocol(n2(j),2) = Protocol(iPrt,1);
     end
     
    [ Ard_c,ExpSetup_c_stim,OKFLAG ] = ScouseTom_SendSettings(Ard_c,ExpSetup_c_stim);
  %% 
     [ Ard_d,ExpSetup_d_stim, logfid_d_stim, matlog_d_stim ] = ScouseTom_StartFile_d( Ard_d,ExpSetup_d_stim,iPrt, 1, 1);   
 [ Ard_c,ExpSetup_c_stim, logfid_c_stim, matlog_c_stim ] = ScouseTom_StartFile_c( Ard_c,ExpSetup_c_stim, iPrt, 1, 1);

    %%
    fprintf(Ard_d, 'M');
    fprintf(Ard_c, 'M');

%%
fprintf(Ard_d, 'G');

[ Ard_d,Ard_c, ExpSetup_d_stim, ExpSetup_c_stim] = ScouseTom_Start_Two_Ard( Ard_d, Ard_c, ExpSetup_d_stim, ExpSetup_c_stim, logfid_d_stim, matlog_d_stim, logfid_c_stim,1);
     

 disp(['Prt' num2str(iPrt) 'finished']);
end

