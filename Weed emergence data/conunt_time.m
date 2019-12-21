clear;clc;
load('survey_time.mat') 
%%%%%得到所有的时间,并计算为天%%%%%
for i = 1:24
    temp = Survey_time(1+18*(i-1));
    Y = fix(temp/10000);
    M = mod(fix(temp/100),100);
    D = mod(temp,100);
    DateNumber(i) = datenum(Y,M,D);
end
%%%%%计算时间差%%%%%
deltaT(1)=0;
for i = 2:24
    deltaT(i) = DateNumber(i) - DateNumber(i-1);
end
%%%%%20181113为第一天生成时间坐标%%%%%
x(1)=1;
for i = 2:24
    x(i) = x(i-1) + deltaT(i);
end

%%%%%求解平均值%%%%%
%%%%%提取%%%%%
load('emergenc_all.mat')
for i = 1:24
    for j = 1:9
        B(i,j) = SS1(j+18*(i-1));
        C(i,j) = SS1(j+9+18*(i-1));
    end
end

%%%%%每条曲线
d1=[1:1:165]; % step
figure
for i=1:9
    yn0=B(:,i);
    yn0=yn0';
    yn(i,:)=interp1(x,yn0,d1,'PCHIP');  
    subplot(3,3,i)
    %plot(d1,yn(i,:));  
    plot(x,yn0,'o',d1,yn(i,:));  
    str_a=sprintf('第%d块样地',i);
    title(str_a)
   
    %hold on
end

figure
for i=1:9
    yy0=C(:,i);
    yy0=yy0';
    yy(i,:)=interp1(x,yy0,d1,'PCHIP');  
    subplot(3,3,i)
    %plot(d1,ync(i,:));  
    plot(x,yy0,'o',d1,yy(i,:));  
    str_a=sprintf('第%d块样地',i);
    title(str_a)
    %hold on
end

%%%%%计算累计生长
yc



%%%%%求均值和标准差%%%%%
figure
y = mean(B,2);
err = std(B,0,2);
%%%%%绘制方差%%%%%
subplot(2,1,1)
errorbar(x,y,err,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red')
%%%%%计算使用除草剂后%%%%%
x2 = mean(C,2);
err2 = std(C,0,2);
subplot(2,1,2)
errorbar(x,x2,err2,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red')