img = imread('testpattern1024.tif');
img = double(img);
[M, N] = size(img);
m = (M + 1) / 2;
n = (N + 1) / 2;
sigma = 4;                 
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
img_result=ifft2(ifftshift(G));   
img_result=real(img_result);                   
subplot(1,2,1);imshow(img,[]);title('inpit');
subplot(1,2,2);imshow(img_result,[]);title('output');
