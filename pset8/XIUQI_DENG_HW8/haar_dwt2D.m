function [LL, LH, HL, HH, img]=haar_dwt2D(j,img)
    [m, n]=size(img);
%     cnt = 0;
    for i=1:m       %transform horizon
        x=ddwt(j,img(i,:));
%         cnt = cnt + 1
        img(i,:)=x;
    end
    
    for t=1:n       %transform vertical
       x=ddwt(j,img(:,t).');
%        cnt = cnt + 1
       img(:,t)=x;
    end
    LL=img(1:m/2,1:n/2);         
    LH=img(1:m/2,n/2+1:n);       
    HL=img(m/2+1:m,1:n/2);        
    HH=img(m/2+1:m,n/2+1:n);     
end