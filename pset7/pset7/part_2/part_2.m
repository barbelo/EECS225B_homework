img1 = imread('Fig1.2(a).jpg');
h_fig1 = entropy(img1)
img2 = imread('Fig1.2(b).tif');
h_fig2 = entropy(img2)

subplot(1,2,1),imshow(img1),title('fig1');
subplot(1,2,2),imshow(img2),title('fig2');
