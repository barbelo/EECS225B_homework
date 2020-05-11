function new_rec = iddwt(j, x)



% 每次修改这里的原始数据, 个数最好是2^n
% x = [9 7 3 5];
%  x = [2 5 8 9 7 4 -1 1];
% x = [2 5 8 9 7 4 -1 1 2 1 8 3 8 0 3 1];

order_max = log(length(x))/log(2);
% fprintf('当前数据最多分解%d阶\n',order_max);
% j = double(input('自定义分解阶数( order<order_max ):'));

% 直接用知自带的分解函数：
new = wavedec(x,j,'haar');  

% 小波重构——任意haar基函数全能重构回去

% matlab默认的haar小波基函数:
low = [1/sqrt(2) 1/sqrt(2)];
high = [1/sqrt(2) -1/sqrt(2)];
% 计算的系数: 与基函数有关
tmp1 = 1/( low(1) + high(1) );

% 迭代重构开始:
xrec = zeros(1,length(new));  % 记录复原的数据
new_rec = new;

for norder = order_max+1-j : order_max  % 这个规律让任意低阶都可以适用
    m = 1;  % 专门用来记录"前半段"位置——给奇数位用的
    for n = 1:2^norder
        half = 2^norder/2;  % 当前重构区间的一半——也是用来给奇数位计算用的
        if mod(n,2) ~= 0  
            % 奇数时操作: 
            xrec(n) = tmp1*( new_rec(m) + new_rec(m+half) );   
            m = m + 1;
        else
            % 偶数时操作: 
            xrec(n) = (new_rec(m-1) - low(1)*xrec(n-1))/low(2);       
        end
    end 
    new_rec(1:n) = xrec(1:n);  % 每次要更新的(后一次重构基于前一次结果): 从前往后
end

% fprintf('%d级分解后重构:\n',j);
% new_rec
% 
% fprintf('自带的%d级重构结构:\n',j);
% [C,S] = wavedec(x,j,'haar');
% waverec(C,S,'haar')