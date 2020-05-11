function y = ddwt(j, x)


x = double(x);
order_max = log(length(x))/log(2);

low = [1/sqrt(2) 1/sqrt(2)];
high = [1/sqrt(2) -1/sqrt(2)];

y = zeros(1,length(x));  % final result
app = zeros(1,length(x)/2);   % approximate
det = zeros(1,length(x)/2);   % detail


m = 1;
xtmp = x;
for norder = 1:j
    for n = 1:2:length(xtmp)
        app(m) = sum(xtmp(n:n+1).*low);
        det(m) = sum(xtmp(n:n+1).*high);
        m = m + 1;
    end
    % from back to front
    y( length(xtmp)/2+1:length(xtmp) ) = det( 1:2^(order_max-norder) ); 
    y( 1:length(xtmp)/2 ) = app( 1:2^(order_max-norder) );             
    xtmp = app( 1:2^(order_max-norder) );
    m = 1;
end
