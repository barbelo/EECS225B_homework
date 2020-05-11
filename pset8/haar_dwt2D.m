

function [LL, LH, HL, HH, img]=haar_dwt2D(j,img)
    [m, n]=size(img);
%     cnt = 0;
    for i=1:m       %每一行进行分解
        x=ddwt(j,img(i,:));
%         cnt = cnt + 1
        img(i,:)=x;
    end
    
    for t=1:n       %每一列进行分解
       x=ddwt(j,img(:,t).');
%        cnt = cnt + 1
       img(:,t)=x;
    end
    %本来分解不应该加mat2gray的，不过为了有好的显示效果就加上了
%     LL=mat2gray(img(1:m/2,1:n/2));          %行列都是低频  
%     LH=mat2gray(img(1:m/2,n/2+1:n));        %行低频列高频
%     HL=mat2gray(img(m/2+1:m,1:n/2));        %行高频列低频
%     HH=mat2gray(img(m/2+1:m,n/2+1:n));      %行列都是高频
    LL=img(1:m/2,1:n/2);          %行列都是低频  
    LH=img(1:m/2,n/2+1:n);        %行低频列高频
    HL=img(m/2+1:m,1:n/2);        %行高频列低频
    HH=img(m/2+1:m,n/2+1:n);      %行列都是高频
end