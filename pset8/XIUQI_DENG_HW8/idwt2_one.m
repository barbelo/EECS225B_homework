function y=idwt2_one(LL,HL,LH,HH)

low = [1/sqrt(2) 1/sqrt(2)];
high = [1/sqrt(2) -1/sqrt(2)];

tmp_mat=[LL,HL;LH,HH];         
[m,n]=size(tmp_mat);       

for k=1:n                   
    ca1=tmp_mat(1:m/2,k);    
    cd1=tmp_mat(m/2+1:m,k);
    tmp1=idwt(ca1,cd1,low,high);  
    yt(:,k)=tmp1;               
end

for j=1:m                   
    ca2=yt(j,1:n/2);        
    cd2=yt(j,n/2+1:n);
    tmp2=idwt(ca2,cd2,low,high); 
    yt(j,:)=tmp2;              
end
y=yt;