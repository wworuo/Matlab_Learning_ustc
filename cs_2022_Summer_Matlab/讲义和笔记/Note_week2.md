# MATLAB -Matrix Laboratory

## Ch4 

### 图像句柄

#### 图像对象

- 每个构成图形的基本单位都被视为一个 对象(Object)，例如： 曲线、曲面、坐标轴、文字... 
- 每个对象都有一个句柄(handle),就像每个人都有一个独一无二的身份证号码 、
- 根据对象的句柄，就可以修改图形对象的所有属性

```matlab
%e.g. h2即对象
>> h2 = figure

h2 = 

  Figure (1) - 属性:

      Number: 1
        Name: ''
       Color: [0.9400 0.9400 0.9400]
    Position: [488 342 560 420]
       Units: 'pixels'

  显示 所有属性

>> h2.Position = [500 400 500 400]
```

**使用“.”引用属性或函数**

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220711141440871.png" alt="image-20220711141440871" style="zoom:80%;" />

#### 函数

- set : 设定某图形对象的某个属性值 

  ```matlab
  t = 0 : 0.1 :4*pi;
  y = exp(-t/4).*sin(t);
  h = plot(t,y);
  set(h,’linewidth’, 3);
  set(h,’Marker’,’o’);
  set(h,’markersize’,20);
  ```

- get： 获得某个图形对象的现有属性值 

  ```matlab
  get(handle,'value');
  ```

  

- findobj：根据某个属性，在句柄图形的层次结构中，找到想要进行编辑 的图形对象。 

  ```matlab
  >>plot(sin([0:pi]),'color','b')
  >>plot(cos([0:pi]),'color','r')
  >>h = findobj('color','r');
  >>set(h,’linewidth’,3);
  ```

  

- gcf :获取当前图像的句柄

  ```matlab
  findobj(gcf,'style','checkbox');
  ```

- gca：获取当前坐标轴的句柄

- gco:

****

### 字符串

> 字符串：用单引号括起来的一个或多个字符

字符串显示为对应的ASCII码值： double(str)

#### 双精度数转换成字符串： num2str

```matlab
x = 31.2;
y = num2str(x);
```

类似也有：int2str

字符串转换成双精度数： str2num

#### 字符串的显示：

**disp**:>>disp ([’Loop ’  int2str(k)  ‘ is done’])

**sprintf**:>>str1 = sprintf('The value of pi is %.2f',pi)

#### 字符串函数

```matlab
>>s = char('math','english','DSP')%连接字符串数组
s = 
3×7 char 数组
'math '
'english'
'DSP'
```

strcat(a,b)：连接两个或多个字符串 

 [a,b]：而会在ab中加空格

strcmp: 比较两个字符串是否完全一致 

finstr: 在一个字符串中查找特定子字符串 

strrep: 用一个子字符串代替特定字符串

****

### 元胞（单元）数组与结构体

#### Cell array

- 将不同类型的、相关的数据集成在一个变量中。

- 该变量称为单元数组，其中的每个元素称为单元（cell）。 

- cell可以是任何数据类型：字符串、双精度数组、其他单元数组。不同的cell可以 包含不同的数据类型

- 用途：使得大量的相关数据的处理与引用变得简单而方便。

- 创建方式

  ```matlab
  %方法一：大括号在右边：
  A(1,1) = { [1 2 3 ; 4 5 6] };
  A(1,2) = {3+4i};
  A(2,1) = {' hello world!'};
  A(2,2) = {1:10};
  
  %方法二：大括号在左边：
  A{1,1} = [1 2 3 ; 4 5 6];
  A{1,2} = 3+4i;
  A{2,1} = 'hello world!';
  A{2,2} = 1:10 ;
  
  %方法三：直接赋值
  B = { [1 2],'张三', 2+3i ,5 }; 
  C = { [1:10], 'USTC'; 4-2j,2};
  
  %方法四：首先生成一个空单元数组，再添加数据。
  C = cell(2,3)
  C(1,1) = {'this is a'} ;
  C(1,1) = {'this is right'} ;
  C{2,2} = 'this works too';
  
  ```

- 显示方式：celldisp(A);  A{:}

- 切片方式 ： A{1,1} 

​	   不能是 A(1,1)!!!

#### Structure

- 类似与单元数组，将不同类型的、相关的数据集成在一个变量中；

- 结构体中每个元素称为字段(field)； 

- 每个字段(field)可以是任何数据类型：字符串、双精度数组、其他单元数组。不同字段可以包含不同的数据类型

- 创建与引用方式：

  ```matlab
  %创建结构体变量circle:
  >> circle.radius = 2.5;
  >> circle.center = [0,1];
  >> circle.linestyle = '--';
  >> circle.color = 'red'
  circle =
  radius: 2.5000
  center: [0 1]
  linestyle: '--'
  color: 'red'
  %再加一个结构
  >> circle(2).radius = 3.4;
  >> circle(2).color = 'green';
  >> circle(2).linestyle = ':';
  >> circle(2).center = [2.3 -1.2]
  
  fieldnames(circle)%返回所含所有成员变量
  ```

  

****

### 稀疏矩阵

> 指大多数元素为0，只有少数非零元素的矩阵

#### 创建----只记录下非零位置与值

```matlab
%将全矩阵(Full Matrix)转换为稀疏矩阵.
>>A=[0 0 5 0; 3 0 3 0 ; 0 0 0 1; 0 4 3 0]
>>S=sparse(A)
S =(2,1) 3
(4,2) 4
(1,3) 5
(2,3) 3
(4,3) 3
(3,4) 1
>>A=full(S) %稀疏矩阵转换为全矩阵

%直接创建稀疏矩阵
%S=sparse(i,j,s,m,n,nzmax)
%i 和j 分别是矩阵非零元素的行和列指标向量，
%s 是非零元素值向量，
%m，n 分别是矩阵的行数和列数。
%i、j、s是长度相同的向量。
%nzmax 最后一个参数nzmax告诉matlab该稀疏矩阵最多有多少个非零元素，便于预先分配内存
>> S = sparse([1 3 2], [1 2 4], [2 4 1], 3, 4)
S = (1,1) 2
(3,2) 4
(2,4) 1

%从文件中创建稀疏矩阵
%设文本文件 T.txt 中有三列内容，第一列是一些行下标，第二列是列下标，第三列是非零元素值。
%T.txt
%1 3 5
%2 1 3
%2 3 3
%3 4 1
%4 2 4
%4 3 3
>>load T.txt
>>S=spconvert(T)
```

#### 函数

- nnz(S) : 返回S中非零元素的个数 
- nonzeros(S):返回列向量，含所有非零元素； 
- nzmax(S): 
- spy(S)： 图形化形式表达稀疏矩阵; 
- [i,j,s]=find(S) ：提取行、列、值

#### 运算

```matlab
>> S = sparse([1 3 2], [1 2 4], [2 4 1], 3, 4)；
>> x = sin(S);
>> x = size(S);
>> A = full(S);
>> B = A.*S;%返回稀疏矩阵
>> C =A + S;%返回全矩阵
```

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220711152217704.png" alt="image-20220711152217704" style="zoom:67%;" />

****

### Matlab音频处理

#### sound()函数/soundsc

把信号的声音回放

**sound(Y)** :默认音频播放

plays the sound at the default sample rate of 8192 Hz

**sound(Y,FS)** :以特定采样率播放样本数据

sends the signal in vector Y (with sample frequency FS) out to the speaker on platforms that support sound. 

Values in Y are assumed to be in the range -1.0 <= y <= 1.0. Values outside that range are clipped.  

Stereo sounds are played, on platforms that support it, when Y is an N-by-2 matrix.

#### xpsound (自带音频)

#### [y, fs] = audioread('file.wav')%从文件中读取音频信号

#### audiowrite('file.wav', y,fs)%将音频数据写入文件

#### audiorecorder %录音

#### audiorecorder(Fs,nBits,nChannels)%录音

```matlab
recObj = audiorecorder; % 默认：单声道 ，采样率fs  = 8000bps , 量化精度nbits=8bit 
recordblocking( recObj, 5) %录音5秒钟 
play(recObj); %播放声音
y = getaudiodata(recObj); %以矩阵存储音频
plot(y);
audiowrite('a.wav',y,fs)
```

#### 音阶合成

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220711160017220.png" alt="image-20220711160017220" style="zoom:67%;" />

#### Matlab 图像处理





## Ch5

### GUI介绍

**Graphical User Interfaces图形用户界面**

**组成成分**（控件 uicontrols）：按钮、 滑动条、列表框

每个控件也是图形对象，也拥有属性与回调函数：**改变控件即改变了输入参数**

改变控件的属性可以调整控件的外观。 利用**回调函数**可以对用户的操作做出相应的响应。（事件驱动）

**实现方式：**

1. 利用GUIDE工具

   ```matlab
   >>guide	
   ```

   GUIDE生成两个文件

   .fig文件：保存GUI的layout,就是展现给用户的界面，界面含有axes,button,listbox等控件。

   .m文件：包含对各种事件的响应，即回调函数。

   ```matlab
   function pushbutton_callback(hObject, eventdata, handles)
   ```

2. App Designer 工具

3. 编程实现



**主要设计过程:** 

> 1. 构思整个GUI的布局与设计任务； 
> 2. 利用GUIDE进行界面设计； 
> 3. 设置界面上各个控件的属性； 
> 4. 编写回调函数代码
>



****

### 基于App Designer的GUI设计

```matlab
>>appdesigner
```

****

### GUI的编程实现

```matlab
hp1 = uicontrol('style','pushbutton');
%修改按钮属性
set(hp1,'position',[100,100,200,200])
set(hp1,'string', '按一下');
set(hp1,'fontsize',24)
%定义回调函数
cmd = 'disp(''你按了我一下'')';%回调函数
set(hp1,'callback',cmd)
你按了我一下
```

另外还有

- slide

- radio

- edit

- list

- frame

- checkbox

- popup

  

```matlab
figure('position', [30 30 300 200]);
axes('position', [0.1 0.2 0.8 0.8]);
pointNum = 20;
[xx, yy, zz] = peaks(pointNum);
surf(xx, yy, zz);
axis tight;
h1 = uicontrol('style', 'checkbox', 'string', 'Grid 
on/off', ...
'position', [10, 10, 80, 20], 'value', 1);
h2 = uicontrol('style', 'edit', 'string', 
int2str(pointNum), ...
'position', [100, 10, 60, 20]);
h3 = uicontrol('style', 'popupmenu', ...
'string', 'hsv|hot|cool', ...
'position', [180, 10, 60, 20]);
set(h1, 'callback', 'grid');
set(h2, 'callback', 'cb2');
set(h3, 'callback', 'cb3');
```

## Ch6 

### Matlab多项式运算

#### 多项式的表示方法

n 阶多项式用长度为 n+1的向量表示， 缺少的幂次项系数为 0 !

$p(x) = a_nx^n+a_{n-1}.....+a_1x+a_0$

**Matlab用向量表示：**[$a_n,a_{n-1},....a_1,a_0$]

#### 多项式运算

```matlab
%多项式显示poly2sym
>>a = [2,-1,0,3];
>>poly2sym(a)
ans =
2*x^3 - x^2 + 3
```

**加减**

```matlab
%多项式相加相减
%如果两个多项式次数不同，则应该把低次多项式中系数不足的高次项用 0 补足，然后进行加减运算。
a =[2,3,1];
b = [1,0];

c = a + [0,b];
```

**乘除**

```matlab
%多项式相乘
p=[1,1];
q=[1,-1];
k = conv(p,q);
%1 1
%  -1 -1
%-----------
%1  0  -1

%多项式相除
[k,r] = deconv(p,q);
p=conv(q,k)+r
```

**求导**

```matlab
k=polyder(p) % 多项式 p 的导数；
k=polyder(p,q)% p*q 的导数；
[k,d]=polyder(p,q)% p/q 的导数，k 是分子，d 是分母
```

**积分**

```matlab
k=polyint(p,a) % 多项式 p 的积分，积分后常数项为a；
k=polyint(p)%多项式 p 的积分，积分后常数项为0；
```

**求根**

```matlab
%例：求多项式[2 -1 0 3]的根
>> p = [2 -1 0 3];
>> r = roots(p)
%根据根构建多项式
>> p1 = poly(r); 
```

**求值**

```matlab
y = polyval(p,x)% 计算多项式 p 在 x 点的值, x 可以是数、向量、矩阵
Y=polyvalm(p,X) % X 必须是方阵，这个是矩阵运算，不是每个位置上运算
```

#### **部分分式展开**

```matlab
[r,p,k] = residue(b,a)
%p是a多项式的分解因式的根
```

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220715142736267.png" alt="image-20220715142736267" style="zoom:100%;" />

#### 多项式数据拟合

假定我们要用一阶多项式拟合：f(x) = a1x+a0
问题：如何选择多项式系数a1 ,a2 ？
准则：均方误差最小；
方法：最小二乘法

```matlab
p = polyfit(x,y,n);
%x,y:已知数据点的横纵坐标，
%n ：事先确定的多项式阶次
%p：返回的多项式系数
```

**读excel文件**

```matlab
[NUM,TXT,RAW]=xlsread('filename')
%NUM返回所有有关数据的二维数组
%TXT返回所有有关文本的内容
%RAW返回所有内容
```

**曲线拟合**

```matlab 
x = [1 2 3 4 5]; 
y = [5.5 43.1 128 290.7 498.4];

p = polyfit(x,y,1);
x2 = 1:0.1:5;
y2 = polyval(p,x2);

plot(x,y,’o’,x2,y2);
yy = polyval(p,x);
err = sum((y-yy).^2);
```

****

### 常微分方程数值解法

#### 微分方程数值解法：

$\frac{dy}{dx} = f(x,y),y(x_0)=y_0,x\in[a,b]$

**基本思想：用差商代替微商**

**具体方法：**

1. 分割求解区间

   等距剖分：$a = x_0<x_1<x_2.......<x_n=b$

   步长 $h = x_{k+1}-x_{k} = (b-a)/n$

2.  差商代替微商

   $\frac{dy}{dx}|_{x_k} \approx \frac{y(x_{k+1})-y(x_k)}{h}$

3. 解代数方程
   $$
   \left\{
   \begin{aligned}
   &y_0=y(x_0) \\
   &y_{k+1} =y_k+hf(x_k,y_k) \\
   &x_{k+1}=x_k+h
   \end{aligned}
   \right.
   $$

```matlab
a = 0; %[a b]为积分区间
b = 2;
n = 5; %中间点数
h = (b-a)/(n-1); %步长
x = linspace(a,b,n);
y = zeros(size(x));
y(1) = 1;
for k = 1:n-1
y(k+1) = y(k) +h *(y(k)+x(k)/(y(k).^2));
end
plot(x,y,'o-');
```

**减少误差方式：**

- 让步长 h 取得更小一些； 
- 改用具有较高精度的数值方法：Runge-Kutta (龙格-库塔) 方法

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220715152130459.png" alt="image-20220715152130459" style="zoom:40%;" />

#### 用Matlab自带函数解初值问题

- 求解析解：dsolve 
- 求数值解： ode45、ode23、 ode113、ode23t、ode15s、 ode23s、ode23tb

```matlab
[T,Y] = solver(odefun,tspan,y0);
%odefun 为所定义的f(x,y)
%y0 为初值条件，
%tspan为求解区间；
%Matlab在数值求解时自动对求解区间进行分割，T (向量) 中返回的是分割点的值(自变量)，Y (向量) 中返回的是解函数在这些分割点上的函数值。
```

**solver 为Matlab的ODE求解器（可以是 ode45、ode23、ode113、ode15s、ode23s、ode23t、ode23tb）**

```matlab
%例子
fun = @(x,y) -2*y+2*x^2+2*x;
%该匿名函数必须有两个输入变量！
[x,y]=ode23(fun,[0:0.1:0.5],1);
```

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220715163059730.png" alt="image-20220715163059730" style="zoom:67%;" />



#### 求解高阶常微分方程：

**用函数文件将方程重写为一阶常微分方程组**

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220715152649365.png" alt="image-20220715152649365" style="zoom:50%;" />

```matlab
%vdpl.m
function dydt=vdpl(t,y)
	dydt =[ y(2);(1-y(1)^2)*y(2)-y(1)];
```

```matlab
[t,y]=ode45(@vdpl,[0,40],[1;0]);
plot(t,y(:,1),'r-');
```

****

### 符号计算

> 先定义符号对象（符号变量、符号表达式）， 再调用相应符号函数进行推理，得到解析解

#### 符号变量定义

##### sym函数，syms函数

```matlab
a = sym('a');
syms c x t alpha; %注意变量间不能有逗号，默认为复数
syms x real %规定x为实数
syms x positive %规定x为正实数
syms y(x) %定义一个符号函数

y = @(x) x^2;%定义一个函数，函数本身可以当作符号变量使用，但返回值可能不是符号数，而是数值

syms x y a b 
f(a, b) = a*x^2/(sin(3*y - b));%直接定义函数,a,b为自变量，x,y为参数，该表达式返回的数一定是符号数
```

#### 化简方程

##### S = simplify(s)

```matlab
yms x a b c
S = simplify(sin(x)^2 + cos(x)^2)
```

S=1

```
S = simplify(exp(c*log(sqrt(a+b))))
```

S = $(a+b)^{c/2}$

#### 变量替换

##### subs(f,x,a) 

- 将符号表达式f中的符号变量x替换为a 
- a可以为 数值/符号变量/符号表达式

```matlab
syms a b c d;
A = [ a b ;c d];
x=det(A);
x1 = subs(x,a,3);
x2 = subs(x1,[ b c d] ,[1 7 4]);
x3 = double(x2); %把符号变量变成双精度数
```

#### 绘制表达式或函数

`fplot(f)` 在默认区间 `[-5 5]`（对于 `x`）绘制由函数 `y = f(x)` 定义的曲线。



`fplot(f,xinterval)` 将在指定区间绘图。将区间指定为 `[xmin xmax]` 形式的二元素向量。



`fplot(funx,funy)` 在默认区间 `[-5 5]`（对于 `t`）绘制由 `x = funx(t)` 和 `y = funy(t)` 定义的曲线



#### 函数求导

##### diff(f)

```matlab
>> syms t x
>> diff(x*t^2))%默认对 x 求导
>> diff(x*t^2,t)%对t求导
```

```matlab
>> syms t
>> f = sin(5*t);
>> diff_f = diff(f,2) %对f求二阶导数
```

#### 找出符号函数中的符号变量

**symvar**

```matlab
syms x y a b 
f(a, b) = a*x^2/(sin(3*y - b)); 
symvar(f)

ans =
[a, b, x, y]
```

#### 不定积分

##### int(expr) 对函数表达式expr进行不定积分

##### int(expr,v) 对函数表达式expr进行不定积分,指定积分变量为v

```matlab
>> syms x z
>> f = x/(1+z^2)
>> int_f1 = int(f) %默认积分变量为x
>> int_f2 = int(f,z)%指定积分变量为z
```

#### 定积分

##### int(expr,a,b) 对函数表达式expr在区 间[a，b]求定积分

##### int(expr,x,a,b) 对指定变量x在[a,b]上积分

```matlab
>> syms x
>> f = x^2*cos(x);
>> int_f = int(f,-6,6)
int_f = 
24*cos(6) + 68*sin(6)
>> double(int_f) %转换为双精度数
ans = 4.043833002081825
```

##### 卷积

```matlab
>> syms t tau
>> x = @(t)exp(-t^2/2)
>> f =x(tau)*x(t-tau)
>> y = int(f,tau,-inf,inf)
```

#### 数值积分

用函数或匿名函数代替表达式

##### q = integral(fun,xmin,xmax)   fun:被积函数句柄； xmin,xmax :积分区间

```matlab
>>q2 = integral(@sin,a,b)
```

```matlab
>>f = @(x) exp(-x.^2).*(log(x)).^2;
>>integral(f,0,+inf)
```

当含有参数时

```matlab
>>f = @(x,c) 1./(x^3-2*x-c)
>>integral(@(x)f(x,5), 0, 2)
```

二重数值积分

```matlab
f = @(x,y) 1./(sqrt(x+y).*(1+x+y));
ymax = @(x) 1-x;
integral2(f,0,1,0,ymax);
```



#### 默认函数

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220715171746256.png" alt="image-20220715171746256" style="zoom:40%;" />

#### 多重积分

##### 不定积分

```matlab
>> syms x y z
>> int(int(int(x*y^2*z^5,x),y),z)
```

##### 定积分

```matlab
>> syms x y
>> int(int(x^2*y,x,2,4),y,1,2)
```

#### 代数方程求解

##### solve(eqn，var) 指定变量var为未知数，返回符号变量数组

```matlab
%ax^2 + bx + c = 0
>> syms a b c x
>> solve(a*x^2+b*x+c == 0) %默认变量为x
>> solve(a*x^2+b*x+c) %与上一句等价
>> solve(a*x^2+b*x+c == 0，c) %指定变量为c
```

##### solve(eqn1,eqn2,…,eqnN,var1,var2,…,varN)求解代数方程组

$2x-3y+4z=5$

$y+4z+x=10$

$-2z+3x+4y=0$

```matlab
>> syms x y z
>> eq1 = 2*x-3*y+4*z == 5
>> eq2= y+4*z+x == 10
>> eq3= -2*z+3*x+4*y ==0 
>> [x,y,z] = solve(eq1,eq2,eq3,x,y,z)
```

更推荐：

```matlab
>> syms x y z
>> eq1=@(x,y,z) 2*x-3*y+4*z-5
>> eq2=@(x,y,z) y+x+4*z-10
>> eq3=@(x,y,z) -2*z+3*x+4*y
>> [x,y,z]=solve(eq1,eq2,eq3,x,y,z)
```

#### 常微分方程求解

##### S = dsolve(eqn):若不指定初值，则会为结果自动添加不定常数

$\frac{d^2y}{dx^2}=cos{2x}-y$

```
syms y(x)
Dy = diff(y);
y(x) = dsolve(diff(y, 2) == cos(2*x) - y, y(0) == 1, Dy(0) == 0);
y(x) = simplify(y)
```

$y(x)=1 - (8sin(x/2)^4)/3$

#### Fourier变换

##### fourier(f,trans_var,eval_point) ，trans_var时域变量x，eval_point频域变量w

```matlab
>>syms x w
>>f = exp(-x^2);
>>fourier(f)%也可以是fourier(f,x,w)
ans = 
pi^(1/2)*exp(-w^2/4)
```

##### 逆变换：ifourier(F,trans_var,eval_point) ，trans_var频域变量w，eval_point时域变量x

#### Laplace变换

##### laplace(f,trans_var,eval_point)， trans_var默认为t，eval_point默认为s

##### ilaplace(F,trans_var,eval_point) trans_var默认为s，eval_point默认为t

## Ch7

### Simulink概述

> 模型化图形输入，对动态系统建模与仿真。

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220718140058382.png" alt="image-20220718140058382" style="zoom:67%;" />
