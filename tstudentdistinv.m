function x = tstudentdistinv(n, A)

x = 0; P = 0.5;
while P < A
    x = x + 0.01;
    P = tstudentdist(n, x);    
end