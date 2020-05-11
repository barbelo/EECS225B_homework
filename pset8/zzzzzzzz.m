function imgt=ihaar_dwt2D(j,img)
    [m, n]=size(img);
%     cnt = 0;
imgt = img;
    for i=1:m       %每一行进行重构
        x=iddwt(j,img(i,:));
%         cnt = cnt + 1
        imgt(i,:)=x;
    end
    
    for t=1:n       %每一列进行重构
       x=iddwt(j,img(:,t).');
%        cnt = cnt + 1
       imgt(:,t)=x;
    end
    %本来分解不应该加mat2gray的，不过为了有好的显示效果就加上了
%     LL=mat2gray(img(1:m/2,1:n/2));          %行列都是低频  
%     LH=mat2gray(img(1:m/2,n/2+1:n));        %行低频列高频
%     HL=mat2gray(img(m/2+1:m,1:n/2));        %行高频列低频
%     HH=mat2gray(img(m/2+1:m,n/2+1:n));      %行列都是高频
%     LL=img(1:m/2,1:n/2);          %行列都是低频  
%     LH=img(1:m/2,n/2+1:n);        %行低频列高频
%     HL=img(m/2+1:m,1:n/2);        %行高频列低频
%     HH=img(m/2+1:m,n/2+1:n);      %行列都是高频
end