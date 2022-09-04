function [Y,N] = popmove(P, X0, N, method)
%求解城市人口迁移问题
%input:P :概率转移矩阵
%input: X0: 初始各城市人口数量
%input: N：迭代次数
%input: method=1 :用𝑋𝑘+1 = 𝑃𝑋𝑘方法； method =2:用特征值方法
%output: Y:N年后各城市人口数量
%output: N:迭代年份
    if nargin<2
       error('输入参数不能少于2个！');
    elseif nargin == 2
        N = 10;
        method = 1;
    elseif nargin == 3
        method = 1;
    end
    
    if ~isempty(find(P<0, 1))
        error('矩阵不能有负数');
    end
    
    if ~isempty(find(sum(P)~= 1, 1))
        error('矩阵每列之和要为1');
    end
    
    if N <=0 
        error('N要大于0')
    end
    
    switch method
        case 1 
            Y = f_iterate(P, X0, N);
        case 2 
            Y = f_eigen(P, X0, N);
        otherwise
            warning("Ilegal Method Number!")
            Y = f_iterate(P, X0, N);
    end 
end

function y = f_iterate(P, X0, N)
    y = (P^N)*X0;
end

function y = f_eigen(P, X0, N)
    [V,D] = eig(P);
    X = V\X0;
    y = V*(D.^N)*X;
    y = real(y);
end
