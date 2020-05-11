img = imread('Pyramid.bmp');
subplot(2,2,1);imshow(img);title('orginal img');
theta = [0:1:179];
R = radon(img,theta);
img_r = iradon(R, theta);
subplot(2,2,2);imshow(img_r, []);title('iradon img');
imwrite(img_r, 'ConvBack.bmp');

theta2 = [0:2:179];
R2 = radon(img,theta2);
img_r2 = iradon(R2, theta2);
subplot(2,2,3);imshow(img_r2, []);title('ConvBack2 img');
imwrite(img_r, 'ConvBack2.bmp');

theta4 = [0:4:179];
R4 = radon(img,theta4);
img_r4 = iradon(R4, theta4);
subplot(2,2,4);imshow(img_r4, []);title('ConvBack4 img');
imwrite(img_r, 'ConvBack4.bmp');
