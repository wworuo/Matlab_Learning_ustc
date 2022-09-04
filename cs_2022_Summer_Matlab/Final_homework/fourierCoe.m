function [a0, a , b] = fourierCoe(f,t,T)
    syms k;
    T12 = T/2;
    w = pi/T12;
    ya = f*cos(k*w*t);
    yb = f*sin(k*w*t);
    a(k) = simplify(int(ya,t,-T12,T12)/T12);
    b(k) = simplify(int(yb,t,-T12,T12)/T12);
    a0 = simplify(int(f,t,-T12,T12)/T12);
end