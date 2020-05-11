function new_rec = iddwt(j, x)



% ÿ���޸������ԭʼ����, ���������2^n
% x = [9 7 3 5];
%  x = [2 5 8 9 7 4 -1 1];
% x = [2 5 8 9 7 4 -1 1 2 1 8 3 8 0 3 1];

order_max = log(length(x))/log(2);
% fprintf('��ǰ�������ֽ�%d��\n',order_max);
% j = double(input('�Զ���ֽ����( order<order_max ):'));

% ֱ����֪�Դ��ķֽ⺯����
new = wavedec(x,j,'haar');  

% С���ع���������haar������ȫ���ع���ȥ

% matlabĬ�ϵ�haarС��������:
low = [1/sqrt(2) 1/sqrt(2)];
high = [1/sqrt(2) -1/sqrt(2)];
% �����ϵ��: ��������й�
tmp1 = 1/( low(1) + high(1) );

% �����ع���ʼ:
xrec = zeros(1,length(new));  % ��¼��ԭ������
new_rec = new;

for norder = order_max+1-j : order_max  % �������������ͽ׶���������
    m = 1;  % ר��������¼"ǰ���"λ�á���������λ�õ�
    for n = 1:2^norder
        half = 2^norder/2;  % ��ǰ�ع������һ�롪��Ҳ������������λ�����õ�
        if mod(n,2) ~= 0  
            % ����ʱ����: 
            xrec(n) = tmp1*( new_rec(m) + new_rec(m+half) );   
            m = m + 1;
        else
            % ż��ʱ����: 
            xrec(n) = (new_rec(m-1) - low(1)*xrec(n-1))/low(2);       
        end
    end 
    new_rec(1:n) = xrec(1:n);  % ÿ��Ҫ���µ�(��һ���ع�����ǰһ�ν��): ��ǰ����
end

% fprintf('%d���ֽ���ع�:\n',j);
% new_rec
% 
% fprintf('�Դ���%d���ع��ṹ:\n',j);
% [C,S] = wavedec(x,j,'haar');
% waverec(C,S,'haar')