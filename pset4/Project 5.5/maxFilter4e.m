function f_hat = maxFilter4e(g, m, n)
fun = @(x)max(x(:));
f_hat = nlfilter(g, [m, n], fun);