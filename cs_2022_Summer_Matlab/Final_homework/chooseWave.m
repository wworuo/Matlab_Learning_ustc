function [t,y,y2] = chooseWave(fs,f0,duty,N,option) 
    t0 = linspace(0,N/f0,N+1);
    t1 = t0(1:end-1);
    T0 = 1/f0;
    T1 = T0*duty/100;
    t2 = 0:1/fs:T0;
    y2 = zeros(size(t2));
    switch option
        case 1
            
            k = 2/T1;
            f = [k,0];
            y2(t2<T1/2) = polyval(f,t2(t2<T1/2));
            f = [-k,2];
            y2(T1/2<=t2 & t2<T1) = polyval(f,t2(T1/2<=t2 & t2<T1));
            y2 = repmat(y2,1,N);
            y2 = y2';
            
            t = zeros(1,3*N+1);
            
            t(1:3:end) = t0;
            t(2:3:end) = t1+T1/2;
            t(3:3:end) = t1+T1; 
            temp = [0 1 0];
            y = repmat(temp,1,N);
            y = [y,0];
           
        case 2
           
            y2(t2<T1) = 1;
            y2 = repmat(y2,1,N);
            y2 = y2';
            
            t = zeros(1,4*N+1);
            t(1:4:end) = t0;
            t(2:4:end) = t1;
            t(3:4:end) = t1+T1; 
            t(4:4:end) = t1+T1;
            temp = [0 1 1 0];
            y = repmat(temp,1,N);
            y = [y,0];
        case 3
            k = 1/T1;
            f = [k,0];
            y2(t2<T1) = polyval(f,t2(t2<T1));
            y2 = repmat(y2,1,N);
            y2 = y2';
            
            
            t = zeros(1,3*N+1);
            t(1:3:end) = t0;
            t(2:3:end) = t1+T1;
            t(3:3:end) = t1+T1; 
            temp = [0 1 0];
            y = repmat(temp,1,N);
            y = [y,0];
    end
end

