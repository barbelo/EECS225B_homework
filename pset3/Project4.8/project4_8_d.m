img = imread('Fig0459(a)(orig_chest_xray).tif');
subplot(2,2,1);imshow(img,[]);title('a');

img = double(img);
[M, N] = size(img);
m = (M + 1) / 2;
n = (N + 1) / 2;
d0 = 170;                
img_fft = fftshift(fft2(img));     
H = zeros(M,N);
G = zeros(M,N);
for i=1:M
   for j=1:N
       d = (i-m)^2 + (j-n)^2;
       H(i,j) = 1 - exp(-d/(2*(sigma^2)));
    end
end
K = img_fft .* H;
G = img_fft .* (0.5 + 0.75 * H);
img_r1=real(ifft2(ifftshift(G)));  
img_r2=real(ifft2(ifftshift(K)));  
subplot(2,2,2);imshow(img_r2,[]);title('b');
subplot(2,2,3);imshow(img_r1,[]);title('c');
img_r1 = uint8(img_r1);
h(1:256) = 0;
for I = 1:256
    idx = find(img_r1 == I - 1);
    h(I) = numel(idx);
end
h = h / (M * N);
s = zeros(1, 256);
for i = 1:256
    for j = 1:i
        s(i) = s(i) + h(j);
    end
end
s2 = round(s * 256);
p = zeros(1, 256);
for i = 1:256
    p(i) = sum(h(s2 == i));
end
img_result = img_r1;
for i = 0:255
    img_result(img_r1 == i) = s2(i + 1);
end

subplot(2,2,4);imshow(img_result,[]);title('output');
