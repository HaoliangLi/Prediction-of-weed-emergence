clear;clc;
%%
load('data_set.mat')
data_Temperature_humidity = sortrows(data_Temperature_humidity,1,'ascend');
%%
for i=1:size(data_Temperature_humidity,1)
     data_Temperature_humidity(i,1) = round(data_Temperature_humidity(i,1));
end
%%
%��֪�Ӳ�����ʱ��:2018-11-13(43417) ~ 2019-04-26(43582)
t_start=43417;
t_end=43582;
%Ѱ����ʼ����
i=1;
while(data_Temperature_humidity(i,1)<t_start)
    i=i+1;
    temp = data_Temperature_humidity(i,1);
end
%ת��
j=1;
while(data_Temperature_humidity(i,1)<=t_end)
    data_HT(j,:) = data_Temperature_humidity(i,:);  %#ok<SAGROW>
    j=j+1;i=i+1;
end
%%
%��ʱ���1��ʼ����
for i =1:size(data_HT,1)
    data_HT(i,8) = data_HT(i,1)-data_HT(1,1)+1;
end
%%
%%%%%����ÿ���ƽ���¶�%%%%%
%j=1;  % ԭʼ����index ����1��ʼ
j=1;
i=1;
while(i<=size(data_HT,1) && j<=data_HT(size(data_HT,1),8))
    sum=0;
    temp=data_HT(i,8);
    while(i<=size(data_HT,1) && temp==data_HT(i,8))
       sum=sum+data_HT(i,4);
       i=i+1;
    end
    data_ava_HT(data_HT(i-1,8))=sum/(i-1);
    j=j+1;
end
%%
plot(data_ava_HT);