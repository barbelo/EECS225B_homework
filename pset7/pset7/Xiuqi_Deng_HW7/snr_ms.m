function snr = snr_ms(img, img_f)
[m, n] = size(img);
snr1 = 0.0;
snr2 = 0.0;
for i = 1:m
    for j = 1:n
        snr2 = snr2 + double(img_f(i, j)) ^ 2;
        snr1 = snr1 + double((img_f(i, j) - img(i, j)))^2;
    end
end
snr = (double(snr2) / double(snr1));
end