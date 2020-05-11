img=imread('Fig1.3.jpg');
[Imgm,Imgn]=size(img);
img_f = double(imcrop(img, [0,0,floor(Imgn/8)*8,floor(Imgm/8)*8]));

m = 8

img_fft=fft2(img_f);
[fftm, fftn] = size(img_fft);
list=reshape(img_fft,1,fftm * fftn);
list = abs(list);
t=list(m);
a = ones(m,m);
for i=1:m
    for j=1:m
        if(abs(img_fft(i,j))<t)
            a(i,j)=0;
        end
    end
end
fun = @(block_struct) a.* block_struct.data;
img_tc=blockproc(img_fft,[m m],fun);

% fun = @(block_struct) img_tr' * block_struct.data * img_tr;
img_tcd=ifft2(img_tc);
imshow(real(img_tcd),[]);title('decoding');
e_8 = e_RMS(img_f, img_tcd)
snr_8 = snr_ms(img_f, img_tcd)