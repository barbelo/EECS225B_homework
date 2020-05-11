function f_hat = minFilter4e(g, m, n)
fun = @(x)min(x(:));
f_hat = nlfilter(g, [m, n], fun);