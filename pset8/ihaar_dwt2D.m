function y=ihaar_dwt2D(dim,x)
% ���� MYWAVEREC2() ������ķֽ�ϵ������x���� dim ���ع����õ��ع����� y
% ���������x �����ֽ�ϵ������
%           dim �����ع�������
% ���������y �����ع�����
% ���Ʒֽ�ͼ��
xd=uint8(x);            % �������������ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
[m,n]=size(x);          % �����������������
for i=1:dim             % ��ת������xd���зֽ��ߴ���
    m=m-mod(m,2);
    n=n-mod(n,2);
    xd(m/2,1:n)=255;
    xd(1:m,n/2)=255;
    m=m/2;n=n/2;
end
% figure;
% subplot(121);imshow(xd);title([ num2str(dim) ' ��С���ֽ�ͼ��']); % �������зֽ��ߵķֽ�ͼ��

% �ع�ͼ��
xr=double(x);           % �������������ݸ�ʽת�����ʺ���ֵ�����double��ʽ
[row,col]=size(xr);     % ���ת������xr��������
for i=dim:-1:1          % �ع������Ǵ��ڲ��������У������ȳ�ȡ���� xr �����ڲ�ֽ��������ع�
    tmp=xr(1:floor(row/2^(i-1)),1:floor(col/2^(i-1)));       % �ع����ڲ�������������Ϊ����xr��2^(i-1)

    [rt1,ct1]=size(tmp);                         % ��ȡ���ع����� tmp ��������
    rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);
    rLL=tmp(1:rt/2,1:ct/2);                    % �����ع����� tmp �ֽ�Ϊ�ĸ�����
    rHL=tmp(1:rt/2,ct/2+1:ct);
    rLH=tmp(rt/2+1:rt,1:ct/2);
    rHH=tmp(rt/2+1:rt,ct/2+1:ct);
    tmp(1:rt,1:ct)=idwt2_one(rLL,rHL,rLH,rHH);              % ���ع�������ص����� tmp

    xr(1:rt1,1:ct1)=tmp;       % �Ѿ��� tmp �����ݷ��ص����� xr ����Ӧ����׼����һ�������ع�
end
% y=xr;                    % �ع�������õ��ľ���xr��Ϊ������� y
y=uint8(xr);            % ������xr�����ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
% subplot(122);imshow(yu);title('С���ع�ͼ��');