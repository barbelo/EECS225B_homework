img = imread('blurry-moon.tif');
img = double(img);
[M, N] = size(img);
m = (M + 1) / 2;
n = (N + 1) / 2;
sigma = 2;                 
img_fft = fftshift(fft2(img));     
H = zeros(M,N);
G = zeros(M,N);
for i=1:M
   for j=1:N
       d = (i-m)^2 + (j-n)^2;
       H(i,j) = exp(-d/(2*sigma^2));
    end
end
G = H .* img_fft;
img_blur=ifft2(ifftshift(G));   
img_blur=real(img_blur); 
mask = img - img_blur;
img_result = img + 5 * mask;
subplot(1,2,1);imshow(img,[]);title('inpit');
subplot(1,2,2);imshow(img_result,[]);title('output');