function f_hat = ctharMean4e(g, m, n, q)
g = double(g);
f = ones(m, n);
g1 = g.^(q + 1);
f1 = conv2(g1, f);
g2 = g.^q;
f2 = conv2(g2, f);
f_hat = f1 ./ f2;


