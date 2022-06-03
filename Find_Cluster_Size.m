function N = Find_Cluster_Size(SIRdB,io)
clusters = [];
SIR = power(10,SIRdB/10);
N = power((io*SIR),2/4)/3;
for i = 0:18
    for k = i:18
        clusters(end+1) = i^2 + i*k + k^2;
    end
end
dist = (clusters - N);
dist(dist<0) = inf;
[~, I] = min(dist);
N = clusters(I);
end
