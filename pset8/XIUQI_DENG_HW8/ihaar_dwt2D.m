function y = ihaar_dwt2D(j,x)

xr=double(x);         
[m,n]=size(xr);    
for i=j:-1:1         
    tmp=xr(1:floor(m/2^(i-1)),1:floor(n/2^(i-1)));      

    [rt1,ct1]=size(tmp);                      
    rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);
    rLL=tmp(1:rt/2,1:ct/2);                   
    rHL=tmp(1:rt/2,ct/2+1:ct);
    rLH=tmp(rt/2+1:rt,1:ct/2);
    rHH=tmp(rt/2+1:rt,ct/2+1:ct);
    tmp(1:rt,1:ct)=idwt2_one(rLL,rHL,rLH,rHH);             

    xr(1:rt1,1:ct1)=tmp;      
end       
y = xr;          