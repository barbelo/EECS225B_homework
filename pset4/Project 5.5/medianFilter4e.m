function f_hat = medianFilter4e(g, m, n)
fun = @(x) median(x(:));
f_hat = nlfilter(g, [m, n], fun);