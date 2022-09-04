x = linspace(-10*pi,10*pi,200);
y = x;
[X,Y]= meshgrid(x,y);
r  = sqrt(Y.^2+X.^2);
Z = sin(r)./r;
mesh(X,Y,Z);