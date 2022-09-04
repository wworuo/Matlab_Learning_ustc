Fs = 8192;
T = 1/Fs;
t = 0:T:0.4;
tt = 0:T:0.8;
t_h = 0:T:0.2;
fA=440;
x = 0:1:12;

f = fA*2.^(x/12);
flow = fA/2*2.^(x/12);
fhigh = fA*2*2.^(x/12);
note_double = @(n) sin(2*pi*f(n)*tt);
note = @(n) sin(2*pi*f(n)*t);
note_half = @(n) sin(2*pi*f(n)*t_h);
dumb = @(n) zeros(size(t));
notelow = @(n) sin(2*pi*flow(n)*t);
notehigh = @(n) sin(2*pi*fhigh(n)*t) ;

notec = @(n) 0.6*notelow(n)+note(n)+0.6*notehigh(n);
do = note(1);
re = note(3);
mi = note(5);
fa = note(6);
so = note(8);
la = note(10);
xi = note(12);
so_1 = notelow(8);

tiger = [do,re,mi,do];
tiger = repmat(tiger,1,2);
tiger = [tiger, mi,fa,note_double(8)];
tiger = [tiger, mi, fa, note_double(8)];

temp = [note_half(8),note_half(10),note_half(8),note_half(6),mi,do];

tiger = [tiger,temp,temp];

temp = [re, so_1, note_double(1)];

tiger = [tiger,temp,temp];

sound(tiger,Fs);

audiowrite('tiger.wav', tiger,Fs);
