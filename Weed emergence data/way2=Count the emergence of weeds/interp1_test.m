%eg:
x=0:2*pi;  
y=sin(x);  
xx=0:0.5:2*pi;  

%interp1��sin�������зֶ����Բ�ֵ������interp1��ʱ��Ĭ�ϵ��Ƿֶ����Բ�ֵ  
y1=interp1(x,y,xx);  
figure  
plot(x,y,'o',xx,y1,'r')  
title('�ֶ����Բ�ֵ')  


%eg:https://cloud.tencent.com/developer/article/1391971
% �¶Ȳ�ֵ
x=0:2:24;
y=[12   9   9   10   18  24   28   27   25   20  18  15  13];

a=13;
y1=interp1(x,y,a,'spline')

% һ�����¶�����
 xi=0:1/3600:24;
 yi=interp1(x,y,xi, 'spline');
 plot(x,y,'o' ,xi,yi)
 
 
% x,y ��ֵ
clear,clc
x0=[0,3,5,7,9,11,12,13,14,15];
y0=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6];
x1=[0:0.1:15];

%�������ղ�ֵ
y1=lagrange(x0,y0,x1);
figure
plot(x0,y0,x1,y1,'.')
title('�������ղ�ֵ')
%�ֶ����Բ�ֵ
y2=interp1(x0,y0,x1);
figure
plot(x0,y0,x1,y2,'.')
title('�ֶ����Բ�ֵ')
%����������ֵ
y3=interp1(x0,y0,x1,'spline');
figure
plot(x0,y0,x1,y3,'.')

% emergenc 
clear,clc
load('time.mat');
load('emerge.mat');
load('temperaure.mat')
x0 = Time;
y0 = Emerge;
y1 = Temperature;
x1=[1:1:165]; % step

figure
subplot(2,1,1)
% ���ζ���ʽ��ֵ
y4=interp1(x0,y0,x1,'PCHIP');  
%figure  
plot(x0,y0,'o',x1,y4,'r');  
title('���ζ���ʽ��ֵ') 

subplot(2,1,2)
plot(x1,y1)
title('�¶�') 

% ����������ֵ
y3=interp1(x0,y0,x1,'spline');
plot(x0,y0,'o',x1,y3,'.')
title('����������ֵ');





