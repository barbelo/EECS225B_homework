img = imread('Fig2.3.jpg');
img_p = padarray(img, [6, 6]);
% subplot(2, 2, 4);imshow(img_p, []);title('origin');
j = 1; %scale 
[LL, LH, HL, HH, ~]= haar_dwt2D(j,img_p);
[m, n] = size(HH);
LLp = zeros(m, n);
LHp = zeros(m, n);
HLp = zeros(m, n);
HHp = zeros(m, n);
img_a = [LLp, LH; HL, HH];
img_ai = ihaar_dwt2D(j, img_a);
subplot(2, 2, 1);imshow(img_ai, []);title('a');

img_b = [LL, LHp; HL, HHp];
img_bi = ihaar_dwt2D(j, img_b);
subplot(2, 2, 2);imshow(img_bi, []);title('b');

img_c = [LL, LH; HLp, HHp];
img_ci = ihaar_dwt2D(j, img_c);
subplot(2, 2, 3);imshow(img_ci, []);title('c');
img_d = [LL, LHp; HLp, HHp];
img_di = ihaar_dwt2D(j, img_d);
subplot(2, 2, 4);imshow(img_di, []);title('d');