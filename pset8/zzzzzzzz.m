function imgt=ihaar_dwt2D(j,img)
    [m, n]=size(img);
%     cnt = 0;
imgt = img;
    for i=1:m       %ÿһ�н����ع�
        x=iddwt(j,img(i,:));
%         cnt = cnt + 1
        imgt(i,:)=x;
    end
    
    for t=1:n       %ÿһ�н����ع�
       x=iddwt(j,img(:,t).');
%        cnt = cnt + 1
       imgt(:,t)=x;
    end
    %�����ֽⲻӦ�ü�mat2gray�ģ�����Ϊ���кõ���ʾЧ���ͼ�����
%     LL=mat2gray(img(1:m/2,1:n/2));          %���ж��ǵ�Ƶ  
%     LH=mat2gray(img(1:m/2,n/2+1:n));        %�е�Ƶ�и�Ƶ
%     HL=mat2gray(img(m/2+1:m,1:n/2));        %�и�Ƶ�е�Ƶ
%     HH=mat2gray(img(m/2+1:m,n/2+1:n));      %���ж��Ǹ�Ƶ
%     LL=img(1:m/2,1:n/2);          %���ж��ǵ�Ƶ  
%     LH=img(1:m/2,n/2+1:n);        %�е�Ƶ�и�Ƶ
%     HL=img(m/2+1:m,1:n/2);        %�и�Ƶ�е�Ƶ
%     HH=img(m/2+1:m,n/2+1:n);      %���ж��Ǹ�Ƶ
end