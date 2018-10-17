close all
fclose(Ard_d); 
fclose(Ard_c);
 clearvars -except ExpSetup_c ExpSetup_d Ard_c Ard_d
%%
[Ard_d] = ScouseTom_Init_Two_Ard('COM3');

%%
[Ard_c] = ScouseTom_Init_Two_Ard('COM4');

%%
[Ard_d] = ScouseTom_Init_Two_Ard('COM8');

[Ard_c] = ScouseTom_Init_Two_Ard('COM9');
%%

[ Ard_d,ExpSetup_d,OKFLAG ] = ScouseTom_SendSettings_4shunt(Ard_d,ExpSetup_d);


%%
[ Ard_c,ExpSetup_c,OKFLAG ] = ScouseTom_SendSettings(Ard_c,ExpSetup_c);


%%

<<<<<<< HEAD
 [ Ard_d,ExpSetup_d, logfid_d, matlog_d ] = ScouseTom_StartFile_d( Ard_d,ExpSetup_d);
=======
 [ Ard_d,ExpSetup_d, logfid_d, matlog_d ] = ScouseTom_StartFile_d( Ard_d,ExpSetup_d,1,1);
>>>>>>> 0723cf7aea2e98c4d2199748989648ca7781c66b
 %%
 [ Ard_c,ExpSetup_c, logfid_c, matlog_c ] = ScouseTom_StartFile_c( Ard_c,ExpSetup_c);

%%

fprintf(Ard_d, 'M');
%fprintf(Ard_c, 'M');

%%
fprintf(Ard_d, 'G');

%%

[ Ard_d,Ard_c, ExpSetup_d, ExpSetup_c] = ScouseTom_Start_Two_Ard( Ard_d, Ard_c, ExpSetup_d, ExpSetup_c, logfid_d, matlog_d, logfid_c);
%%


fprintf(Ard_d, 'S');
<<<<<<< HEAD

fprintf(Ard_c, 'S');
=======
% fprintf(Ard_c, 'S');
>>>>>>> 0723cf7aea2e98c4d2199748989648ca7781c66b

%
fprintf(Ard_d, 'H');
<<<<<<< HEAD

fprintf(Ard_c, 'H');
=======
% fprintf(Ard_c, 'H');
>>>>>>> 0723cf7aea2e98c4d2199748989648ca7781c66b


