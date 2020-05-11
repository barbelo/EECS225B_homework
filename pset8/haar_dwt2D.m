

function [LL, LH, HL, HH, img]=haar_dwt2D(j,img)
    [m, n]=size(img);
%     cnt = 0;
    for i=1:m       %ÿһ�н��зֽ�
        x=ddwt(j,img(i,:));
%         cnt = cnt + 1
        img(i,:)=x;
    end
    
    for t=1:n       %ÿһ�н��зֽ�
       x=ddwt(j,img(:,t).');
%        cnt = cnt + 1
       img(:,t)=x;
    end
    %�����ֽⲻӦ�ü�mat2gray�ģ�����Ϊ���кõ���ʾЧ���ͼ�����
%     LL=mat2gray(img(1:m/2,1:n/2));          %���ж��ǵ�Ƶ  
%     LH=mat2gray(img(1:m/2,n/2+1:n));        %�е�Ƶ�и�Ƶ
%     HL=mat2gray(img(m/2+1:m,1:n/2));        %�и�Ƶ�е�Ƶ
%     HH=mat2gray(img(m/2+1:m,n/2+1:n));      %���ж��Ǹ�Ƶ
    LL=img(1:m/2,1:n/2);          %���ж��ǵ�Ƶ  
    LH=img(1:m/2,n/2+1:n);        %�е�Ƶ�и�Ƶ
    HL=img(m/2+1:m,1:n/2);        %�и�Ƶ�е�Ƶ
    HH=img(m/2+1:m,n/2+1:n);      %���ж��Ǹ�Ƶ
end