img = imread('hubble.tif');
img = double(img);
subplot(1,2,1);imshow(img,[]);title('input');
f_hat = minFilter4e(img, 15, 15);
subplot(1,2,2);imshow(f_hat,[]);title('output');