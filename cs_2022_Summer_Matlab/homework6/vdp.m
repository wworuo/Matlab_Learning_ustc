function dfdt = vdp(t,f,sigma,rho,beta)
    dfdt = zeros(3,1);
    dfdt(1) = sigma*(f(2)-f(1));
    dfdt(2) = f(1)*(rho -f(3))-f(2);
    dfdt(3) = f(1)*f(2)-beta*f(3);
end

