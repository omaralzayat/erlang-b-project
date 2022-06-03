
function [N, Ncells, Rcell, TrafficCell, TrafficSector, Pbs_dBm] = sys(gos,area,density,SIRdB,sectoring)
%N is the Cluster size
c = 340;
BW = 900;
io = 6;

switch sectoring
    case 'no sectoring'
        io = 6;
    case '120'
        io = 2;
    case'60'
        io = 1;
end

[Ncells,TrafficCell,TrafficSector] = Find_NumberofCells_Traffic(SIRdB,io,gos,density,area,c);

%we can get the cell radius knowing that cellarea = 1.5R^2*sqrt(3)
area_sqm = area * 1e6;
cellarea = area_sqm / Ncells;
Rcell = sqrt(cellarea/(1.5*sqrt(3)));

% base station transmitted power has to be greater than the sensitivity of
% the moblie station on the radius of the cell
MSp_dBm = -95;
Lp_max = Hata(BW,20,1.5,Rcell);
Pbs_dBm = MSp_dBm + Lp_max;
distance = logspace(0,log10(Rcell),100);
Pr = zeros(length(distance),1);

for i = 1:length(distance)
    Pr(i) = Pbs_dBm - Hata(BW,20,1.5,distance(i));
end

semilogx(distance,Pr);
xlabel('distance (m)');
ylabel('Recieved Power (dBm)');
grid on;
end