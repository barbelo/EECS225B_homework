img = imread('Fig2.2.jpg');
[LL, LH, HL, HH]=mydwt2(img)
subplot(2, 2, 1);imshow(LL, []);title('LL');
subplot(2, 2, 2);imshow(LH, []);title('LH');
subplot(2, 2, 3);imshow(HL, []);title('HL');
subplot(2, 2, 4);imshow(HH, []);title('HH');
