%homework2.2
clc;
clear;
P=[0.32 0.17 0.11 0.46;
    0.18 0.43, 0.32, 0.33;
    0.27, 0.22, 0.39, 0.14;
    0.23, 0.18, 0.18, 0.07];
X0 = 1e4*[1,3,5,8]';
[Y1, N1] = popmove(P, X0, 20, 1);
[Y2, N2] = popmove(P, X0, 40, 2);