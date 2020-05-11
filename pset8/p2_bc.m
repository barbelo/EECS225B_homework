img = imread('Fig2.2.jpg');
[LL, LH, HL, HH, img_r]=haar_dwt2D(3,img);
% subplot(2, 2, 1);imshow(LL, []);title('LL');
% subplot(2, 2, 2);imshow(LH, []);title('LH');
% subplot(2, 2, 3);imshow(HL, []);title('HL');
% subplot(2, 2, 4);imshow(HH, []);title('HH');
subplot(1, 2, 1); imshow(img_r, []);
img_i = ihaar_dwt2D(3,img_r);
subplot(1, 2, 2);imshow(img_i, []);