close ;
clear ;
clc;
clf;

T1 = 1;
T2 = 2;
T = 3;
w = 2*pi/T;
N = 15;
%周期三角波信号
p_amp = [1 , 0, 0];
p1_t = 0:14;
p1_amp = repmat(p_amp,1,5);
h_wav = plot(p1_t, p1_amp,'linewidth',2);
axis([0 14 -0.2 1.2])
axis square;
hold on;

%傅里叶级数
a0 = 2*T1/T;
ak = @(k) 8/T*((sin(k*w*T1/2))/(k*w))^2;

%绘图
 t = 0: T/100:9*T;
 x_syn = zeros(size(t));
 x_syn = x_syn + a0/2;%直流成分
 h_syn = plot(t,x_syn,'r','linewidth',1.5);
 [A,map] = rgb2ind(frame2im(getframe),256);
 imwrite(A,map,'fourier.gif','GIF', 'Loopcount',inf,'DelayTime',0.5);

 for k = 1 : N
     pause(0.5);
     x_tmp = ak(k)*cos(k*w*t);
     x_syn = x_syn + x_tmp;
     h_syn.YData = x_syn;
     [A,map] = rgb2ind(frame2im(getframe),256);
     legend('raw','fourierN')
     title(k)
     imwrite(A,map,'fourier.gif','GIF',  'WriteMode','append','DelayTime',0.5);
 end




