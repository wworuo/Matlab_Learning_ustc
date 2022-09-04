t = linspace(0,pi,200);
p = linspace(0,2*pi,200);
[theta,phi] = meshgrid(t,p);
X = sin(theta).*cos(phi);
Y = sin(theta).*sin(phi);
Z = cos(theta);
h = surf(X,Y,Z);
axis equal;