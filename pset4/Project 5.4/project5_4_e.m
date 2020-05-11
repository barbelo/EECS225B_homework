img = imread('circuitboard-gaussian.tif');
subplot(1,2,1);imshow(img,[]);title('input');
f_hat = aMean4e(img, 3, 3);
subplot(1,2,2);imshow(f_hat,[]);title('output');
