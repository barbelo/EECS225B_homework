img = imread('Fig2.4.jpg');
subplot(1, 2, 1);imshow(img, []);title('origin');
j = 2; %scale 
[LL, LH, HL, HH, ~]= haar_dwt2D(j,img);
[m, n] = size(HH);
LLp = zeros(m, n);
LHp = zeros(m, n);
HLp = zeros(m, n);
HHp = zeros(m, n);
img_a = [LL, LHp; HLp, HHp];
img_ai = ihaar_dwt2D(j, img_a);
subplot(1, 2, 2);imshow(img_ai, []);title('a');
e = e_RMS(img, img_ai) 
snr = snr_ms(img, img_ai)