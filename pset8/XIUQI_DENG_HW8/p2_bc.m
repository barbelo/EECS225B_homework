img = imread('Fig2.2.jpg');
j = 2;
[LL, LH, HL, HH, img_r]=haar_dwt2D(j,img);
subplot(1, 2, 1); imshow(img_r, []);
img_i = ihaar_dwt2D(j,img_r);
subplot(1, 2, 2);imshow(img_i, []);