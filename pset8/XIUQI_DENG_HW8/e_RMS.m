function e = e_RMS(img, img_f)
[m, n] = size(img);
e = 0.0;
for i = 1:m
    for j = 1:n
        e = e + double((img_f(i, j) - img(i, j))^2);
    end
end
e = double(e);
e = e / (m * n);
e = sqrt(e);
end