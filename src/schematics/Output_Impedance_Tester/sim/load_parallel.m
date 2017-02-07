%% Initialize variables.
filename = 'Parallel_Droop.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);

RL = dataArray{:, 1};
Vmeas = dataArray{:, 2};
IOut = dataArray{:, 3};
ILoad = dataArray{:, 4};

clearvars filename delimiter startRow formatSpec fileID dataArray ans;
%%

Isource = 100e-6; %100 uA 

Vsim = RL*Isource; 

Vdiff = Vsim - Vmeas;

for iLoad =1:length(RL)
Zout(iLoad) = RL(1)*RL(iLoad)*(Vmeas(1)-Vmeas(iLoad))/(Vmeas(iLoad)*RL(1) - Vmeas(1)*RL(iLoad));
end





figure
hold on
plot(RL,Vsim,':');
plot(RL,Vmeas)
hold off
