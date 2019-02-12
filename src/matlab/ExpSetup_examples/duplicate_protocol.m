%%
%4 shunt %10 repeats
n = [1,3,5,7,9];
n2 = [2,4,6,8,10];
ExpSetup.Protocol = zeros(size(Protocol,1)*10,8);
for i = 1:size(Protocol,1)
    for j = 1:length(n)
        ExpSetup.Protocol(n(j),1:4) = Protocol(i,1:4);
        ExpSetup.Protocol(n(j),5:8) = Protocol(i,5:8);
        ExpSetup.Protocol(n2(j),1:4) = Protocol(i,5:8);
        ExpSetup.Protocol(n2(j),5:8) = Protocol(i,1:4);
    end
   
   n = n+10;
   n2 = n2+10;
end
   

%%
%2 shunt %10 repeats
n = [1,3,5,7,9];
n2 = [2,4,6,8,10];
ExpSetup.Protocol = zeros(size(Protocol,1)*10,4);
for i = 1:size(Protocol,1)
    for j = 1:length(n)
        ExpSetup.Protocol(n(j),1:2) = Protocol(i,1:2);
        ExpSetup.Protocol(n(j),3:4) = Protocol(i,3:4);
        ExpSetup.Protocol(n2(j),1:2) = Protocol(i,3:4);
        ExpSetup.Protocol(n2(j),3:4) = Protocol(i,1:2);
    end
   
   n = n+10;
   n2 = n2+10;
end

%%
%no shunt %10 Repeats
n = [1,3,5,7,9];
n2 = [2,4,6,8,10];
ExpSetup.Protocol = zeros(size(Protocol,1)*10,2);
for i = 1:size(Protocol,1)
    for j = 1:length(n)
        ExpSetup.Protocol(n(j),1) = Protocol(i,1);
        ExpSetup.Protocol(n(j),2) = Protocol(i,2);
        ExpSetup.Protocol(n2(j),1) = Protocol(i,2);
        ExpSetup.Protocol(n2(j),2) = Protocol(i,1);
    end
   
   n = n+10;
   n2 = n2+10;
end