Cluster1 = zeros(30,1);
Cluster2 = zeros(30,1);
Cluster3 = zeros(30,1);
for SIR = 1:30
    a1 = Find_Cluster_Size(SIR, 6);
    a2 = Find_Cluster_Size(SIR, 2);
    a3 = Find_Cluster_Size(SIR, 1);
    Cluster1(SIR) = a1;
    Cluster2(SIR) = a2;
    Cluster3(SIR) = a3;
end
sir = 1:30;
figure;
plot(sir, Cluster1,'o-', sir, Cluster2,'s-', sir, Cluster3,'*-');
ylabel('Cluster Size');
xlabel('SIR (dB)');
legend('no sectoring', '120 sectoring', '60 sectoring');
grid on;
