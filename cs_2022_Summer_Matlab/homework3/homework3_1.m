close ;
clear ;
clc;
clf;
N = 500;
theta = linspace(0,8*pi,N);
t =linspace(0,2*pi,100);
R = 10;
r = 3;
phi = ((R+r)/r).*theta;
cirx0 = R*cos(theta);
ciry0 = R*sin(theta);
x0 = (R+r).*cos(theta);
y0 = (R+r).*sin(theta);
x = x0 + r.*cos(phi);
y = y0 + r.*sin(phi);
hold on;
axis equal;
axis([-20 20 -20 20]);
set(gca,'xtick',[],'ytick',[])
title("Epicycloid")
plot(cirx0,ciry0,'k','linewidth',2);
hp = plot(x(1),y(1),'marker','o','markersize',10,'markerfacecolor','r');
for k=1:N
    axis equal;
    axis([-20 20 -20 20]);
	set(hp,'xdata',x(k),'ydata',y(k),'marker','o','markersize',10,'markerfacecolor','r');
    cirx = x0(k) + r.*cos(t);
    ciry = y0(k) + r.*sin(t);
    l = plot(x((1:k)),y((1:k)),'b');
    c = plot(cirx,ciry,'k');
    [A,map] = rgb2ind(frame2im(getframe),256);
    if k == 1
        imwrite(A,map,'epicycloid.gif','GIF', 'Loopcount',inf,'DelayTime',1e-4);
    else
        imwrite(A,map,'epicycloid.gif','GIF', 'WriteMode','append','DelayTime',1e-4);
    end
    pause(0.005);%使图动起来的原因
    delete(c);
    delete(l);
end
plot(x,y,'b');

