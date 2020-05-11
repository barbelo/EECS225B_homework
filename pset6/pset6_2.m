img = imread('Pyramid.bmp');
theta = [0:1:179];
R = radon(img,theta);
img_bp = iradon(R, theta);
subplot(1,3,1);imshow(img_bp, []);title('iradon');
% xlswrite('projection.xls', R);
M = 465;
width = 2 ^ nextpow2(size(R, 1));
img_fft = fft(R, width);
filter1 = hamming(512,'periodic');
filter2 = 2*[0:(width/2 - 1), width/2:-1:1]'/width;
filt1 = zeros(width, 180);
filt2 = zeros(width, 180);
for i = 1:180
    filt1(:, i) = img_fft(:, i).* filter1;
    filt2(:, i) = img_fft(:, i).* filter2;
end
img_ifft1 = real(ifft(filt1));
img_ifft2 = real(ifft(filt2));

fbp1 = zeros(M);
fbp2 = zeros(M);
for i = 1:180
    rad = deg2rad(theta(i));
    for x = 1:M
        for y = 1:M
            t = round((x - M / 2) * cos(rad) - (y - M / 2) * sin(rad));
            if t < size(R, 1) / 2 && t > -size(R, 1)/ 2
                fbp1(x, y) = fbp1(x, y) + img_ifft1(round(t + size(R, 1) / 2), i);
                fbp2(x, y) = fbp2(x, y) + img_ifft2(round(t + size(R, 1) / 2), i);
            end
            tmp = (x - M / 2) * cos(rad) - (y - M / 2) * sin(rad) + M / 2;
            t = round(tmp);
            if t > 0 && t <= M
                fbp1(x, y) = fbp1(x, y) + img_ifft1(t, i);
                fbp2(x, y) = fbp2(x, y) + img_ifft2(t, i);
            end
        end
    end
end
fbp1 = (fbp1 * pi) / 180;
fbp1 = fbp1.';
fbp2 = (fbp2 * pi) / 180;
fbp2 = fbp2.';
imwrite(fbp2, 'Polar.bmp');
subplot(1,3,2);imshow(fbp1, []);
subplot(1,3,3);imshow(fbp2, []);
