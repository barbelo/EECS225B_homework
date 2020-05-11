function f_hat = aMean4e(g, m, n)
g = double(g);
f = zeros(m, n);
for i = 1:m
    for j = 1:n
        f(i, j) = 1/(m * n);
    end
end
f_hat = conv2(g, f);

