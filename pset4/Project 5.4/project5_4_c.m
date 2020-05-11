img = imread('circuitboard-salt.tif');
subplot(1,2,1);imshow(img,[]);title('input');
f_hat = harMean4e(img, 3, 3);
subplot(1,2,2);imshow(f_hat,[]);title('output');
