function [Ncells,TrafficCell,TrafficSector] = Find_NumberofCells_Traffic(SIRdB,io,gos,density,area,c)
N = Find_Cluster_Size(SIRdB,io);
u = density*area;     %Number of users
A = u*0.025;
CpC = floor((io*c)/(6*N));           %number of channels per sector

%having the number of channels we can get the expected traffic of a single cell

TrafficSector = erlang_b1(gos,CpC);
TrafficCell = TrafficSector * 6 / io;
Ncells = ceil(A / TrafficCell);
end
