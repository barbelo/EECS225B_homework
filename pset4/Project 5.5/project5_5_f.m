img = imread('circuitboard-saltandpep.tif');
subplot(2,2,1);imshow(img,[]);title('a');
img = medianFilter4e(img, 3, 3);
subplot(2,2,2);imshow(img,[]);title('b');
img = medianFilter4e(img, 3, 3);
subplot(2,2,3);imshow(img,[]);title('c');
img = medianFilter4e(img, 3, 3);
subplot(2,2,4);imshow(img,[]);title('d');