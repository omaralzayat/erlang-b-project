c=340;
area = 100;
density = 1400;
SIRdB = 50;
GOS = 0.01:0.01:0.3;
%No sectoring
Ncells1 = NaN*zeros(length(GOS),1);
TrafficCell1 = NaN*zeros(length(GOS),1);
TrafficSector1 = NaN*zeros(length(GOS),1);
%120
Ncells2 = NaN*zeros(length(GOS),1);
TrafficCell2 = NaN*zeros(length(GOS),1);
TrafficSector2 = NaN*zeros(length(GOS),1);
%60
Ncells3 = NaN*zeros(length(GOS),1);
TrafficCell3 = NaN*zeros(length(GOS),1);
TrafficSector3 = NaN*zeros(length(GOS),1);
for i = 1:length(GOS)
    [Ncells1(i),TrafficCell1(i)] = Find_NumberofCells_Traffic(SIRdB,6,GOS(i),density,area,c);
    [Ncells2(i),TrafficCell2(i)] = Find_NumberofCells_Traffic(SIRdB,2,GOS(i),density,area,c);
    [Ncells3(i),TrafficCell3(i)] = Find_NumberofCells_Traffic(SIRdB,1,GOS(i),density,area,c);
end
figure;
subplot(2,1,1);
plot(GOS, Ncells1, GOS, Ncells2, GOS, Ncells3);
title('No. of cells vs GOS');
ylabel('NO. of Cells');
xlabel('GOS');
legend('no sectoring', '120 sectoring', '60 sectoring');
grid on;

subplot(2,1,2);
plot(GOS, TrafficCell1, GOS, TrafficCell2, GOS, TrafficCell3);
title('Traffic of cell vs GOS');
ylabel('Traffic of one Cell (Erlang)');
xlabel('GOS');
legend('no sectoring', '120 sectoring', '60 sectoring');
grid on;
