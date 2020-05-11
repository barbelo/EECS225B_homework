img = imread('NoisyImg.bmp');
% subplot(2,2,1);imshow(img);title('origin');

%  Median
img_m = medfilt2(img);
subplot(2,2,2);imshow(img_m);title('median filter');
imwrite(img_m, 'Median.bmp');

% Wiener
img_w = wiener2(img);
subplot(2,2,3);imshow(img_w);title('wiener filter');
imwrite(img_w, 'Wiener.bmp');

%adaptive midian
img_adam = img;
img_adam(:) = 0;
nmin = 3; 
nmax = 9;
fg=false(size(img));
for k=nmin:2:nmax
    zmin=ordfilt2(img,1,ones(k,k),'symmetric');
    zmax=ordfilt2(img,k*k,ones(k,k),'symmetric');
    zmed=medfilt2(img,[k k],'symmetric');
    processB=(zmed>zmin)&(zmax>zmed)&(~fg);
    zB=(img>zmin)&(zmax>img);
    outputZxy=processB&zB;
    outputZmed=processB&~zB;
    img_adam(outputZxy)=img(outputZxy);
    img_adam(outputZmed)=zmed(outputZmed);
    fg=fg|processB;
    if all(fg(:))
        break;
    end
end
img_adam(~fg)=img(~fg);

subplot(2,2,4);imshow(img_adam);title('adaptive median filter');
imwrite(img_w, 'AdaptiveMedian.bmp');

img_combina = wiener2(img_adam);
subplot(2,2,1);imshow(img_combina);title('combination');
imwrite(img_combina, 'ResultA.bmp');

            