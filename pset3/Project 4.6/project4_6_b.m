img = imread('testpattern1024.tif');
[M, N] = size(img);
for i=1:M
    for j=1:N
        img_r(i, j) = 255 - img(i, j);
    end
end
img_fft = fftshift(fft2(img_r));   
H = zeros(M, N);
D0 = 30;
n = 2;
m = M / 2;
n = N / 2;
for i=1:M
    for j=1:N
        d = (i-m)^2 + (j-n)^2;
        H(i,j) = 1/(1 + (d / D0)^(2 * n));
    end
end
G = H .* img_fft;
img_result=ifft2(ifftshift(G));   
img_result=real(img_result);   
t = max(img_result(:));
for i = 1:M
    for j = 1:N
        result(i, j) = img_result(i, j) > (t * 0.77);
    end
end

subplot(1,3,1);imshow(img,[]);title('inpit');
subplot(1,3,2);imshow(img_result,[]);title('output');
subplot(1,3,3);imshow(result,[]);title('thresholded');
