%方波的傅里叶级数合成示例。2022.07.06
%脉冲宽度 T1 ； 周期 T0；合成谐波次数N


clear
close

%方波周期T0,脉冲宽度T1,合成阶次
T1 = 2;
T0 = 3;

N = 10;

%画方波周期信号的时域波形
p_t   =  [ 0 ,  0 , T1,  T1, T0 ];
p_amp = [0  ,  1,   1,     0,    0  ];

p1_t = [p_t - T0 ,p_t , p_t + T0];
p1_amp = [p_amp ,p_amp,p_amp];

h_wav = plot(p1_t, p1_amp,'linewidth',2);
axis([-0.2*T0  2*T0 -0.2 1.2])
hold on

%计算傅里叶级数
         %方波一个周期的傅里叶变换
X_F = @(w, T1) (1 - exp(-j*w*T1))./(j*w);
         %周期信号的傅里叶级数
 a_k = @(k, T0,T1) X_F(2*pi/T0*k , T1) / T0;
 
 a_0 = T1/T0; %信号的直流分量
 
 a  = a_k([1:N],T0,T1);
 
 abs_a = abs(a); %每个谐波的相对大小
 angle_a = angle(a); %每个谐波的相移
 
 %合成波形
 t = [-0.2*T0: T0/100:2*T0];
 
 x_syn = zeros(size(t));
 
 x_syn = x_syn + a_0;%直流成分
 
 h_syn = plot(t,x_syn,'r','linewidth',1.5);
 
 for k = 1 : N
     x_tmp =  2*abs_a(k)*cos(k*2*pi/T0*t + angle_a(k));
     x_syn = x_syn + x_tmp;
     h_syn.YData = x_syn;
     title(k)
     pause
 end
     
     
     
     
 
 
 
 
 
 
 
         

