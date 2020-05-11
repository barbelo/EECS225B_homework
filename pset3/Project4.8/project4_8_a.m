img = imread('Fig0457(a)(thumb_print).tif');
subplot(1,3,1);imshow(img,[]);title('inpit');

for i = 1:M
    for j = 1:N
        img(i, j) = 255 - img(i, j);
    end
end
img = double(img);
[M, N] = size(img);
m = (M + 1) / 2;
n = (N + 1) / 2;
sigma = 10;                 
img_fft = fftshift(fft2(img));     
H = zeros(M,N);
G = zeros(M,N);
for i=1:M
   for j=1:N
       d = (i-m)^2 + (j-n)^2;
       H(i,j) = d > sigma;
    end
end
G = H .* img_fft;
img_r=real(ifft2(ifftshift(G)));   
subplot(1,3,2);imshow(img_r,[]);title('result of filtering');
t = max(img_r(:));
for i=1:M
   for j=1:N
       img_result(i, j) = img_r(i, j) > 10;
    end
end
subplot(1,3,3);imshow(img_result,[]);title('output');
