%%%%%������г�������%%%%%
for i =1:8514
UT(i,4) = UT(i,1)-43308+1;
end

%%%%%����ÿ���ƽ���¶�%%%%%
j=1;  % ԭʼ����index ����1��ʼ
for i = 1:356
    cnt=0;
    temp = 0;
    while( j <= 8514 && UT(j,4)<=i)
        temp = temp + UT(j,3);
        cnt = cnt +1;
        j= j + 1;
    end
    avaT(i) = temp/cnt;
end

%%%%%�����Ӳ������ڼ���¶�ֵ%%%%%
for i = 1:165
    Tu(i) = avaT(i+109)
end