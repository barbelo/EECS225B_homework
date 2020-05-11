img=imread('Fig1.3.jpg');
[Imgm,Imgn]=size(img);
img_f = double(imcrop(img, [0,0,floor(Imgn/8)*8,floor(Imgm/8)*8]));

m = 8

img_dct=dct2(img_f);
[dctm, dctn] = size(img_dct);
list=reshape(img_dct,1,dctm * dctn);
list = abs(list);
t=list(m);
a = ones(m,m);
for i=1:m
    for j=1:m
        if(abs(img_dct(i,j))<t)
            a(i,j)=0;
        end
    end
end
fun = @(block_struct) a.* block_struct.data;
img_tc=blockproc(img_dct,[m m],fun);

% fun = @(block_struct) img_tr' * block_struct.data * img_tr;
img_tcd=idct2(img_tc);
imshow(img_tcd,[]);title('decoding');
e_8 = e_RMS(img_f, img_tcd)
snr_8 = snr_ms(img_f, img_tcd)