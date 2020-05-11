img = imread('blurry-moon.tif');
[M, N] = size(img);
H = laplacianTF4e(M, N);
img_fft = fftshift(fft2(double(img)));
G = H .* img_fft;
img_la = real(ifft2(ifftshift(G)));  
img_la = img_la / max(img_la(:));
img_result = double(img) - img_la;

subplot(1,3,1);imshow(img,[]);title('inpit');
subplot(1,3,2);imshow(H,[]);title('Laplacian');
subplot(1,3,3);imshow(img_result,[]);title('output');