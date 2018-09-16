
%%
%fclose(Ard1); fclose(Ard2);
[Ard1] = ScouseTom_Init('COM4');
[Ard2] = ScouseTom_Init('COM3');
%%
[ Ard1,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard1,ExpSetup);
[ Ard2,ExpSetup,OKFLAG ] = ScouseTom_SendSettings(Ard2,ExpSetup);

%%
fprintf(Ard1, 'M');
fprintf(Ard2, 'M');

%%
fprintf(Ard1, 'G');

%%
fprintf(Ard1, 'S');
fprintf(Ard2, 'S');
%%
fprintf(Ard1, 'H');
fprintf(Ard2, 'H');