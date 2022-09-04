sigma = 10;
rho = 28;
beta = 8/3;
tspan = [0 20];
f0 = [10 10 10];
[t,f] = ode45(@(t,f) vdp(t,f,sigma,rho,beta),tspan, f0);
hp = plot3(f(:,1),f(:,2),f(:,3));
set(hp,'linewidth',1,'color','b');
grid on
axis square