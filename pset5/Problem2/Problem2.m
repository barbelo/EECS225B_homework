img = imread('NoisyBlur.bmp');


f_blur = fspecial('disk', 3);
wnr1 = deconvwnr(img, f_blur, 0.5);
wnr2 = deconvwnr(img, f_blur, 0.02);
wnr3 = deconvwnr(img, f_blur, 0.001);
subplot(1,3,1);imshow(wnr1);
subplot(1,3,2),imshow(wnr2);
subplot(1,3,3),imshow(wnr3);
imwrite(wnr1, 'ResultB.bmp');
imwrite(wnr2, 'ResultC.bmp');
imwrite(wnr3, 'ResultD.bmp');
