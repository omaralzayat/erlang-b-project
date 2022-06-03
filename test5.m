
SIRdB_test5 = 19;
U_test_Range = 10000:50:200000;
ud=U/100;    %user Density
A=U_test_Range*.025;
gos_test=.02; 

io_1=6;      % i for no sectorization
io_2=2;      % i for 120 sectorization
io_3=1;      % i for 60 sectorization



%No sectoring

%get number of channels per sector from part A
N_1 = Find_Cluster_Size(SIRdB_test5,io_1);
CpC_1 = floor((io_1*c)/(6*N_1));

%get Relation between number of cell and user Density
TrafficSector_1 = erlang_b1(gos_test,CpC_1);
TrafficCell_1 = TrafficSector_1 * 6 / io_1;
Ncells_1 = ((U_test_Range*.025) / TrafficCell_1);

%get relation between Radius and user Density 
area_sqm = area * 1e6;
cellarea1 = area_sqm ./ Ncells_1;
Rcell_1 = sqrt(cellarea1/(1.5*sqrt(3)));

%120

%get number of channels per sector from part A
N_2 = Find_Cluster_Size(SIRdB,io_2);
CpC_2 = floor((io_2*c)/(6*N_2)); 

%get Relation between number of cell and user Density
TrafficSector_2 = erlang_b1(gos_test,CpC_2);
TrafficCell_2 = TrafficSector_2 * 6 / io_2;
Ncells_2 = ((U_test_Range*.025) / TrafficCell_2);

%get relation between Radius and user Density 
area_sqm = area * 1e6;
cellarea_2 = area_sqm ./ Ncells_2;
Rcell_2 = sqrt(cellarea_2/(1.5*sqrt(3)));

%60  

%get number of channels per sector from part A
N_3 = Find_Cluster_Size(SIRdB,io_3);
CpC_3 = floor((io_3*c)/(6*N_3)); 

%get Relation between number of cell and user Density
N_3 = Find_Cluster_Size(SIRdB,io_3);
TrafficSector_3 = erlang_b1(gos_test,CpC_3);
TrafficCell_3 = TrafficSector_3 * 6 / io_3;
Ncells_3 = ((U_test_Range*.025) / TrafficCell_3);

%get relation between Radius and user Density 
area_sqm = area * 1e6;
cellarea3 = area_sqm ./ Ncells_3;
Rcell_3 = sqrt(cellarea3/(1.5*sqrt(3)));



figure (1)

plot(ud,int16(Ncells_1), ud ,int16(Ncells_2), ud, int16(Ncells_3));

title('user density Vs the number of cells');
xlabel('user density (users/km^2)');
ylabel('the number of cells');
legend('no sectoring', '60 sectoring', '120 sectoring');
grid on;


figure (2)
plot (ud, Rcell_1, ud, Rcell_2, ud, Rcell_3)

title('user density Vs the cell radius');
xlabel('user density (users/km^2)');
ylabel('the cell radius');
legend('no sectoring', '60 sectoring', '120 sectoring');
grid on;
  
    