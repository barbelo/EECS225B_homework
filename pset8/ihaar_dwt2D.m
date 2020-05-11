function y=ihaar_dwt2D(dim,x)
% 函数 MYWAVEREC2() 对输入的分解系数矩阵x进行 dim 层重构，得到重构矩阵 y
% 输入参数：x ——分解系数矩阵；
%           dim ——重构层数；
% 输出参数：y ——重构矩阵。
% 绘制分解图像
xd=uint8(x);            % 将输入矩阵的数据格式转换为适合显示图像的uint8格式
[m,n]=size(x);          % 求出输入矩阵的行列数
for i=1:dim             % 对转换矩阵xd进行分界线处理
    m=m-mod(m,2);
    n=n-mod(n,2);
    xd(m/2,1:n)=255;
    xd(1:m,n/2)=255;
    m=m/2;n=n/2;
end
% figure;
% subplot(121);imshow(xd);title([ num2str(dim) ' 层小波分解图像']); % 画出带有分界线的分解图像

% 重构图像
xr=double(x);           % 将输入矩阵的数据格式转换回适合数值处理的double格式
[row,col]=size(xr);     % 求出转换矩阵xr的行列数
for i=dim:-1:1          % 重构次序是从内层往外层进行，所以先抽取矩阵 xr 的最内层分解矩阵进行重构
    tmp=xr(1:floor(row/2^(i-1)),1:floor(col/2^(i-1)));       % 重构的内层矩阵的行列数均为矩阵xr的2^(i-1)

    [rt1,ct1]=size(tmp);                         % 读取待重构矩阵 tmp 的行列数
    rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);
    rLL=tmp(1:rt/2,1:ct/2);                    % 将待重构矩阵 tmp 分解为四个部分
    rHL=tmp(1:rt/2,ct/2+1:ct);
    rLH=tmp(rt/2+1:rt,1:ct/2);
    rHH=tmp(rt/2+1:rt,ct/2+1:ct);
    tmp(1:rt,1:ct)=idwt2_one(rLL,rHL,rLH,rHH);              % 将重构结果返回到矩阵 tmp

    xr(1:rt1,1:ct1)=tmp;       % 把矩阵 tmp 的数据返回到矩阵 xr 的相应区域，准备下一个外层的重构
end
% y=xr;                    % 重构结束后得到的矩阵xr即为输出矩阵 y
y=uint8(xr);            % 将矩阵xr的数据格式转换为适合显示图像的uint8格式
% subplot(122);imshow(yu);title('小波重构图像');