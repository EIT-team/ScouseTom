close all
fclose(Ard_d); 
fclose(Ard_c);
clearvars -except ExpSetup_c ExpSetup_d Ard_c Ard_d
%%
[Ard_d] = ScouseTom_Init_Two_Ard('COM4');
%%
[Ard_c] = ScouseTom_Init_Two_Ard('COM3');

%%

[ Ard_d,ExpSetup_d,OKFLAG ] = ScouseTom_SendSettings_4shunt(Ard_d,ExpSetup_d);


%%
[ Ard_c,ExpSetup_c,OKFLAG ] = ScouseTom_SendSettings(Ard_c,ExpSetup_c);


%%

 [ Ard_d,ExpSetup_d, logfid_d, matlog_d ] = ScouseTom_StartFile( Ard_d,ExpSetup_d);
 [ Ard_c,ExpSetup_c, logfid_c, matlog_c ] = ScouseTom_StartFile( Ard_c,ExpSetup_c);

%%

fprintf(Ard_d, 'M');
fprintf(Ard_c, 'M');

%%
fprintf(Ard_d, 'G');

%%

[ Ard_d,Ard_c, ExpSetup_d, ExpSetup_c] = ScouseTom_Start_Two_Ard( Ard_d, Ard_c, ExpSetup_d, ExpSetup_c, logfid_d, matlog_d, logfid_c);
%%

%If you want to start without getting prompts and the whole file
%association procedure
% fprintf(Ard_d, 'S');
% fprintf(Ard_c, 'S');


%% If you want to stop half way through
% fprintf(Ard_d, 'H');
% fprintf(Ard_c, 'H');



