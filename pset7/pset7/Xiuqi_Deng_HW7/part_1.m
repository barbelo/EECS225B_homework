img = imread('Fig1.1.jpg');
subplot(1,3,1),imshow(img),title('origin')
[m, n] = size(img);

k = 4;
topmask = uint8(2 ^ (k) - 1) * uint8(2 ^ (8 - k));
bottonmask = uint8(2 ^ (8 - k) - 1);

img_q = bitand(img, topmask);
subplot(1,3,2),imshow(img_q),title('uniform quantization')
e_uq = e_RMS(img, img_q)
snr_uq = snr_ms(img, img_q)

img_igs = img;
for i = 1:m
    sum = 0.0;
    for j = 1:n
        if(bitand(img(i, j), topmask) == topmask)
            img_igs(i, j) = topmask;
            sum = img(i, j) * 1.0;
        else
            sum = img(i, j) * 1.0 + bitand(uint8(sum), bottonmask) * 1.0;
            img_igs(i, j) = bitand(uint8(sum), topmask);
        end
    end
end
subplot(1,3,3),imshow(img_igs),title('igs')
e_igs = e_RMS(img, img_igs)
snr_igs = snr_ms(img, img_igs)