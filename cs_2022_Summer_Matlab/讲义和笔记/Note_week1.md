# MATLAB -Matrix Laboratory

## Ch1 介绍

#### 路径设置

当前目录->当前子目录->已设置好的路径

#### 存储与加载变量

```mat
load a.mat
save a.mat
```

#### 清除

```matlab
clear % 清除所有变量
clear % 清除变量r
clc % 清除当前页面
```

#### 右除与左除

```matlab
5/3 %=1.667
5\3 %=0.6
```

#### 变量查询

```matlab
who %显示工作空间中的所有变量
whos %查看工作空间中所有变量的详细属性
whos r %查看x的详细信息
```

#### 特殊变量名

```matlab
pi %3.1415
exp(1) %自然对数e
inf/Inf %无穷大 1/0
nan/NaN % Not a Number 0/0
eps%浮点运算相对精度 实数最小间隔 
i/j %虚数单位
```

#### 基本数学函数

```matlab
sin cos tan asin acos %三角函数
sinh cosh tanh %双曲函数
log %ln
log10 %log
exp 
fix floor ceil round %取整函数
%Y = fix( X ) 将 X 的每个元素朝零方向四舍五入为最近的整数
%Y = round( X ) 将 X 的每个元素四舍五入为最近的整数
```

#### 基本数据类型

int8 int16 int32 int64

uint8 uint16

single 单精度浮点数 double 双精度

char 字符/字符串

cell array 单元数组

struct array 结构数组

#### 基本逻辑判断



#### 复数运算

```matlab
abs %取模
angle %角度
real %实部
imag %虚部
complex(3,2) %构造复数3+2i
conj %共轭
```



#### 随机数

```matlab
x = rand %0 – 1之间均匀分布的随机数
rand(2,100) = rand([2,100])%产生2行100列随机分布0~1的随机数
9x-3 %-3到6的随机数

randn %产生均值为0，方差为1的高斯分布的随机数
X = randi(imax) %返回一个介于 1 和 imax 之间的伪随机整数标量
X = randi(imax,n) %返回 n×n 矩阵，其中包含从区间 [1,imax] 的均匀离散分布中得到的伪随机整数。
randi(10,[3,4]) %返回一个由介于 1 和 10 之间的伪随机整数组成的 3×4 数组。
```

#### 

## Ch2 

### 数组与矩阵

#### 矩阵快速生成方式

f(N) %默认N*N矩阵

f(r,c) % r行 c列

**提示：**生成与x相同大小的矩阵方式，y = f(size( x ) )

```matlab
ones %元素全为1的矩阵或数组
zeros %元素全为0的矩阵或数组
eye %对角线元素为1，其他全为0的矩阵
rand %均匀分布的随机数
randn %高斯分布的随机数，均值为0，方差为1
pascal %由帕斯卡三角形得来的方阵
magic %行、列、对角线元素之和相等的方阵
```

#### 数组与矩阵数据结构

```matlab
%行向量
x1  = [1 2 3]
	= [1,2,3]
    = [1:3]
    = [1:1:3]
%列向量
x2 = [1;2;3] = 
[1
2
3]
%数组索引
x = [5 6 8 1 3 4 2 ]
x(3) = 8
%数组切片
x([1:3]) = [5 6 8]
x([2, 6 ]) = [8  2]
%向量运算
x1 .* x2 
x1 ./ x2
exp(x1).*sin(x2)
```

```matlab
%矩阵
A   = [2 3 4;5 6 7]
	= [2 3 4
	   5 6 7]
length(A) %=3 行向量长度
size(A) %= 2 3 多少行 多少列
size(A,1) %行数
size(A,2) %列数
A = zeros(2,3)
特定位置元素
A(2,3) = 7
A(4) = 6
%切片
A(:,2) 第二列
A(1,:) 第一行
转化成数组(列向量)
A(:) = 
[2 
5 
3
6
4
7]
%最后一个元素
A(end)
A(end:-1:1)%逆转顺序
```

#### 矩阵运算

对每个元素都操作

```matlab
A+10
A*2
A.^3 %每个元素三次方
A.*A %相当于A.^2
sin(A)
exp(A)
A*B %矩阵乘法
A^2 %矩阵乘法！！！
```

#### find 函数 ---按值索引

*查找非零元素的索引和值*

k = find(X) 返回一个包含数组 X 中每个非零元素的线性索引的向量。

find(X,n) 返回与 X 中的非零元素对应的前 n 个索引。

find(Condition) 返回满足特定条件的索引(数组)

#### 矩阵函数

```matlab
%重构矩阵  个数保持不变改变矩阵形状
reshape(x, M, N) 
%生成[A, A
	  A, A]
repmat(A,2,2); 
cat %连接
sort %把每一列排序一下
max %返回每列最大值 ------>> 矩阵中最大的元素 max(max(A))
min 
mean %返回每列平均值
flipud %上下颠倒
fliplr %左右颠倒
sum % 返回每列总和
```

```matlab
A' %共轭转置
inv(A) %矩阵的逆 <=> A^(-1)
det(A) %行列式
rank(A) %返回行秩与列秩
trace(A) %迹
```



#### 特征值与特征向量

**d  = eig(A)** 返回特征值
**[V,D] = eig(A)** ：[V,D] = eig(A) produces **a diagonal matrix D** of eigenvalues and **a full matrix V** whose columns are the corresponding eigenvectors  so that **A*V = V *D**.

#### 矩阵分解

**[L,U] =lu(A)：**LU分解, A=LU，利用高斯消元法，L为对角线为1的下三 角矩阵，U为上三角矩阵。

**s = svd(A)** 奇异值分解 

**[Q,R] = qr(A): **QR分解，A=QR ,Q为正交矩 阵， R为上三角矩阵

**R= chol(A):** Cholesky分解:A=R’R，A为正 定矩阵 ，R为上三角矩阵

#### 线性方程组求解

Ax =B => x = A\B 左除

Ax =B => x = A-1B

#### 马尔可夫行列式

定义方阵：所有列之和为1，且元素为非负数

特征值性质：一定有为1的特征值，且其他特征值为（0，1）

### 脚本文件 script file

>
> 一串指令的集合; 
>
> 执行结果与在命令窗口逐行输入执行结果一样;
>
> 没有输入输出参数。

#### 分号结尾

```matlab
%useScript.m
%first use script file
a = 1;
b = 2;
c = input("prompt")%prompt是提示语句,返回来自命令行中交互的内容，相当于scanf
d = a + b + c;
```

**注：user_entry = input('prompt', 's')** 用户输入的内容作为字符串赋给变量 user_entry

#### 在命令行里使用脚本文件

```matlab
>>useScript %运行程序
>>help useScript %查看注释
```

#### 循环语句

**for 循环变量 = 表达式**
	**循环体；**
**end**

```matlab
y=0; n=100;
for k=1:n
	y=y+1/(2*k-1);
end
```

**while 表达式**
	**循环体;**
**end**

```matlab
sum = 0;
a = 1;
while a<=100
	sum = sum+a;
	a = a +1;
end
```

**if expression**
    **statements**
**elseif expression**
    **statements**
**else**
    **statements**
**end**

```matlab
for c = 1:ncols
    for r = 1:nrows
        
        if r == c
            A(r,c) = 2;
        elseif abs(r-c) == 1
            A(r,c) = -1;
        else
            A(r,c) = 0;
        end
        
    end
end
A
```

**switch 表达式**
	**case 表达式1**
	**执行语句1**
	**case 表达式2**
	**执行语句2**
	**……**
	**case 表达式m**
	**执行语句m**
	**otherwise**
	**执行语句n** 
**end**

### 函数文件 function file

> 一般有输入参 数与输出参数
>
> 在函数中定义的变量为局部变量，存储 在单独的内存工作区内，不被调用的程序所见。

**注：**待调用的函数必须与文件名相同

- 可以创建子函数，在主函数中调用

- 内置确定输入、输出变量的数目 nargin, nargout

  ```matlab
  function output = myfunc(input1,input2)
      if nargin == 1
          input2 = 1;
      end
      if(input2 ==1)
          output = f1(input1);
      else
          output = f2(input1);
      end
  end
  function out = f1(in)
      out = sin(in);
  end
  
  function out = f2(in)
      out = cos(in);
  end
  ```

  #### 创建匿名函数：句柄@

  提高函数调用速度：matlab调用函数时每次 都是要搜索所有的路径，如果一个函数在程 序中需要经常用到，使用函数句柄，可以提 高程序速度。 

  当matlab关闭或工作区被清空（clear）， 利用函数句柄创建的函数失效

```matlab
>>sqr = @(x) x.^2; %创建自定义函数
>> a = sqr(3) %调用
```

```matlab
>>hd_sin = @sin; %创建内建函数句柄
>> a = hd_sin(pi) %调用
```

### 程序优化

#### 使循环向量化

向量运算>迭代运算

#### 为数组预先分配内存

栈>堆

静态分配>动态分配

### 信号产生

产生频率为1Hz的幅度呈指数衰减的正弦信号
$$
x(t) = e^{-t}sin(2\pi t)
$$

```matlab
fs = 20;
t = 0:1/fs:5;
x = exp(-t).*sin(2*pi*t);
plot(t,x)
```

## Ch3 绘图

### 二维绘图：绘图函数-----plot(x,y)

#### 信号产生

```matlab
x = 0:pi/100:4*pi;
x = linspace(0, 4*pi,100);%与上句等价
y = sin(x)
plot(x,y)
```

**注：**x 与 y的向量长度必须相等，若只给定一个向量， 则横坐标是索引值， 如 ：plot(y)

#### 一些函数

```matlab
close %关闭图片	
figure %使用默认属性值创建一个新的图窗窗口。生成的图窗为当前图窗,可以生成多个figure窗口
shg %使当前图窗可见，并将其置于屏幕上所有其他图窗的前面
hold on %保持原图不变，可以反复在一张图上加曲线 
hold off %相反
grid on %绘图加网格
grid minor %切换改变次网格线的可见性。次网格线出现在刻度线之间。并非所有类型的图都支持次网格线。
```

```matlab
%圆
r = 2;
xc = 4;
yc = 3;

theta = linspace(0,2*pi,100);
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;
plot(x,y)
axis equal
```

#### 多条曲线

- 画多条曲线时，Matlab自 动赋予每条曲线不同的颜 色。

plot(x, y1, x, y2, x, y3);

- 也可以把y1 、y2 、y3组 成一个矩阵，此时会对矩 阵的每个行向量作图。

 z = [y1 ; y2 ;y3]; plot(x,z);

#### 曲线参数

```matlab
plot(x,y,'r-','linewidth',3);
plot(x,y1,'r-o',x,y2,'k--.',x,y3,'b:x');
plot(x,y,'k:*')
plot(x,y,'color',[0 0 0])%rgb
```

#### 曲线参数LineSpec

| **Line Style** |      **说明**       |
| :------------- | :-----------------: |
| **-**          |      **实线**       |
| **--**         |      **虚线**       |
| **:**          | **点线Dotted line** |
| **-.**         |  **Dash-dot line**  |
| **Mark**       |
| *****          |      **星点**       |
| **O**          |      **圆形**       |
| **+**          |      **加号**       |
| **X**          |      **叉号**       |
| **.**          |      **点号**       |
| **Color**      |                     |
| b（0 0 1）     |         蓝          |
| g （0 1 0）    |         绿          |
| k (0 0 0)      |         黑          |
| r (1 0 0)      |         红          |
| **组合**       |                     |
| `'--or'`       |   红色+虚线+圆点    |

#### 曲线参数：Name-Value Pair Arguments

**注：如果想修改某个参数，可以在修改位置前添加索引Name**

如 'Color' 'Linewidth'  'MarkerSize' MarkerEdgeColor MarkerFaceColor

```matlab
plot(x,y,'r--x','Marker','square','MarkerIndices',5)
```

#### 返回值 hp = plot(x,y)

返回对象

set(p,'Color','r',)；等价于下面代码

```matlab
p = plot(1:10);
c = p.Color;
p.Color = 'red';
```

#### 指令

| **指令** instruction("str") |                |
| --------------------------- | -------------- |
| title                       | 标题           |
| xlabel ylable               | x,y轴说明      |
| legend                      | 说明曲线       |
| text                        | 图形中加入文字 |



```matlab
xlabel('t = 0 to 2\pi'); 
ylabel('values of sin(t) and e^{-x}') 
title('Function Plots of sin(t) and e^{-x}'); 
legend('sin(t)','e^{-x}')
```

- legend指令：画出一小方块，给出每条曲线的说明 

- “\”为特殊符号，用于产 生上标、下标、希腊字母、数学符号等；遵循LaTex数学模式 

- 标题、坐标轴说明等的文字大小、位置也是可以修改的，见Matlab Help

- text(x, y, ‘string’)  x、y ：文字起始坐标位置 string ：文字内容

- gtext(‘string’) 用鼠标单击图形，在选中点处放入说 明文字string

#### 双纵坐标轴

-  plotyy函数
- 在同一窗口画幅度相差很大的两条曲线，采用不同的y轴刻度。

```matlab
x = 0:0.01:20;
y1 = 200*exp(-0.05*x).*sin(x);
y2 = 0.8*exp(-0.5*x).*sin(10*x);
plotyy(x,y1,x,y2,'plot');	
```

#### 坐标轴控制

**坐标轴刻度与长宽比控制**

```matlab
axis ([xmin xmax ymin ymax]) 
axis normal %默认的长宽比
axis square %长宽比为1
axis equal %长宽比不变，但两轴刻度比例一致,画圆
axis tight %图轴紧贴图形
axis off %取消坐标轴
```

#### 子图绘制

- 在同一窗口中画多条曲线 
- 打开多个窗口，在每个窗口中画一条曲线 
- 还可以利用subplot函数，在同一窗口中开设多 个子窗口，每个子窗口画一条曲线。

**在一个窗口中画多个图形**

- subplot(m,n,p)

- 将窗口分成 m ×n 个子窗口，下一个 plot 指令绘图于第 p 个子窗口 
- p 的算法为由左至右，一列一列 
- 也可写成：subplot(mnp)

```matlab
x = 0:pi/30:2*pi
subplot(2,2,1) ; 
plot(x,sin(x)) ;title(‘sin(x)’) %左上角
subplot(2,2,2) ; 
plot(x,cos(x)) ;title(‘cos(x))’) %右上角
subplot(2,2,3); plot(x,exp(-x).*sin(3*x)); 
subplot(2,2,4); plot(x, x.^2);
```

#### 当数组值为复数

plot(z)将z 的实部和虚部当成x坐标和y坐标来画图

```matlab
plot(z)
plot(real(z),imag(z))
```

#### 其他图

bar（x,y） ：柱状图

****

### 三维绘图

#### 三维曲线

- **x=x(t) ,y=y(t),z=z(t)**
- **plot3(x,y,z)**

```matlab
%三维螺旋线
t = 0:pi/20:8*pi;
x = sin(t);
y = cos(t);
z = 1.5*t;
hp = plot3(x,y,z);
set(hp,'linewidth',2,'color','b');
grid on
axis square
```

**注：**hp为plot函数返回值，作为对象的句柄

通过更改属性值，可以修改线图的某些方面。使用圆点表示法查询和设置属性。



****

#### 空间曲面

- z = f(x,y)

**网格生成函数：meshgrid**------>映射域

生成平面点的映射

- [X,Y] = meshgrid(-3:0.1:3);

```matlab
gx = [1 2 3];
gy = [-2:2];
[x,y] = meshgrid(gx,gy);
```

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220708151836266.png" alt="image-20220708151836266" style="zoom:67%;" />

**曲面函数mesh(x,y,z)   空间网格图**

```matlab
[x,y] = meshgrid(-3:0.1:3);
r  = sqrt(x.^2+y.^2);
z = sin(r)/r;
mesh(x,y,z);
```

**曲面函数surf(x,y,z) 空间网面图** 

**曲面颜色函数  colormap**   

颜色映射图：把第一行的颜色对应曲面的 最高点，最后一行颜色对应曲面最低点。其余高 度颜色依照线性内插法给出

- ```matlab
  %rgb颜色映射
  map = [0 0 0.3
      0 0 0.4
      0 0 0.5
      0 0 0.6
      0 0 0.8
      0 0 1.0];
  ```

- ```matlab
  colorbar %色柱
  colormap jer%默认的一些颜色映射
  colormap summer
  ```

```matlab
surf(x,y,z,gradient(z));%以曲面梯度大小设定颜色
surf(x,y,z,del2(z));%以曲面曲率大小设定颜色：
```

**改变图形的观察视角：**

- view(az,el);    az:方位角 el：仰角
- view(x,y,z) 
- view(2)；% az=0，el=90 XY平面
-  view(3)；%az=-37.5,el=30
- view(90, 0)   %YZ平面

****

#### 等高线

- meshc(x,y,z) 绘制有登高线的空间曲面
-  meshz(x, y, z)：绘制含0平面的空间曲面
- contour(x,y,z,20)：平面上的等高线 ,共20条

```
contour(X,Y,Z,'--') %改变曲线形状
contour(X,Y,Z,'ShowText','on')%显示数值
[M,c] = contour(Z);c.LineWidth = 3;%返回等高线矩阵和等高线对象 c。显示等高线图后，使用 c 设置属性
```

- contour3：空间中的等高线 
- pcolor ：在二维平面中以颜色表示曲面的高度
-  contourf ： 填充的二维等高线图
- clabel：标注等高线高度

****

#### v = f(x，y，z)可视化 ------标量场， 矢量长

- 对三维体切片，在截面处用不同颜色表征 在该点的函数值大小。
- **slice(X,Y,Z,V,sx,sy,sz)**

slice(x,y,z,v, [-1 0 1],[],[])

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20220708155410996.png" alt="image-20220708155410996" style="zoom:90%;" />

### 动态图像

1. 画背景曲线

2. hold on

3. ```matlab
   %动点
   for k=1:lenth(t)
   	set(hp,'xdata',t(k),'ydata',y(k),
   	'marker','o',
   	'markersize',10,
   	'markerfacecolor','r'));
   	pause(0.05)%使图动起来的原因
   end
   ```

4. 保存图片

​	getframe: 捕获当前plot画面，写入成gif文件

​	Imwrite: Write image to graphics file

```matlab
% 画椭圆 x*x/4 + y*y/3 = 1的切线
a = 12*cos(0:2*acos(1/3):200*pi)+9i*sin(0:2*acos(1/3):200*pi);
figure();
h = plot(a(1));
axis equal
axis([-12,12,-9,9]);
[A,map] = rgb2ind(frame2im(getframe),256);
imwrite(A,map,'test.gif','LoopCount',Inf,'DelayTime',0.1);
for ii = 1:length(a)
    h.XData(ii) = real(a(ii));
    h.YData(ii) = imag(a(ii));
    [A,map] = rgb2ind(frame2im(getframe),256);
    imwrite(A,map,'test.gif','WriteMode','append','DelayTime',0.1);
    pause('on')
    pause(0.2)
end	
```

