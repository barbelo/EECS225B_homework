function y = idwt(cA,cD,lpr,hpr)

na=length(cA);             
nd=length(cD);

while (nd)>=(na)         
                           
    na=length(cA);
    for i=1:2 * na - 1       
        if mod(i,2)
            upl(i)=cA((i+1)/2);
        else
            upl(i)=0;
        end
    end
    cvl=conv(upl,lpr);     
    
    cD_up=cD(nd-na+1:nd);   
    ndup = length(cD_up);
    for i=1:2 * ndup - 1       
        if mod(i,2)
            uph(i)=cD_up((i+1)/2);
        else
            uph(i)=0;
        end
    end
    cvh=conv(uph,hpr);     
    
    cA=cvl+cvh;           
    cD=cD(1:nd-na);       
    na=length(cA);         
    nd=length(cD);
end                         
y=cA;                       

