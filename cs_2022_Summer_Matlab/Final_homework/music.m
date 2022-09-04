function [t,m,fs] = music(option)
    fs = 20000;
    T = 1/fs;
    t = 0:T:0.4;

    fA=440;
    x = 0:1:24;
    f = fA*2.^(x/12);
    flow = fA/2*2.^(x/12);
    fhigh = fA*2*2.^(x/12);
    note = @(n) sin(2*pi*f(n)*t);
    
    notelow = @(n) sin(2*pi*flow(n)*t);
    notehigh = @(n) sin(2*pi*fhigh(n)*t) ;

    notec = @(n) 0.6*notelow(n)+note(n)+0.6*notehigh(n);
    switch option
        case 1          
            m = notec(1);
        case 2
            m = notec(3);
        case 3
            m = notec(5);
        case 4
            m = notec(6);
        case 5
            m = notec(8);
        case 6
            m = notec(10);
        case 7
            m = notec(12);
        case 8
            m = notec(13);
        case 9
            m = notec(15);
        case 10
            m = notec(17);
        case 11 
            m = notec(18);
        case 12
            m = notec(20);
        case 13
            m = notec(22);
        case 14
            m = notec(24);
    end
end