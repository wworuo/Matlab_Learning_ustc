function func = getFunc(f0,duty,option)
    T0 = 1/f0;
    T1 = T0*duty/100;
    syms x;
    x1 = x +T0;
    switch option
        case 1
            k = 2/T1;
            func(x) = k*x*heaviside(x)+ (2-2*k*x)*heaviside(x-T1/2)+(k*x-2)*heaviside(x-T1);   
        case 2
            func(x) = heaviside(x)- heaviside(x-T1);
        case 3
            k = 1/T1;
            func(x) = k*x*heaviside(x)-k*x*heaviside(x-T1);
    end
    func(x) = func(x)+ func(x1);
end
