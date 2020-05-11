function f_hat = harMean4e(g, m, n)
g = double(g);
[M, N] = size(g);
f = ones(m, n);
for i = 1:M
    for j = 1:N
        g(i, j) = m * n * g(i, j);
    end
end
f_hat = conv2(g, f);

