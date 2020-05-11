function f_hat = geoMean4e(g, m, n)
g = double(g);
[M, N] = size(g);
f = ones(m, n);
for i = 1:M
    for j = 1:N
        g(i, j) = log(g(i, j));
    end
end
f_hat = conv2(g, f);
for i = 1:M
    for j = 1:N
        f_hat(i, j) = exp(f_hat(i, j)) ^(1/(m * n));
    end
end

