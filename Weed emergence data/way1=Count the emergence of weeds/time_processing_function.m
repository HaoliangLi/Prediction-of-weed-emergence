%%%%%对天进行初步处理%%%%%
for i =1:8514
UT(i,4) = UT(i,1)-43308+1;
end

%%%%%计算每天的平均温度%%%%%
j=1;  % 原始数据index ，从1开始
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

%%%%%计算杂草生长期间的温度值%%%%%
for i = 1:165
    Tu(i) = avaT(i+109)
end