close all;
clc,clear;
b = fir1(6,0.1,'low');
[h,w] = freqz(b,1,'whole',512);
%plot(w/pi,20*log10(abs(h)))
plot(w/pi,abs(h))
ax = gca;
ax.YLim = [-0.2 1.2];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude')

f1 = 40;
f2 = 400;
fs=1000;
t=0:(1/fs):(1/fs)*100;

x = sin(2*pi*f1*t)+sin(2*pi*f2*t);
b = b*2;
y = filter(b,1,x);
figure;
subplot(2,1,1);
plot(t,x);
title('Original Signal')
subplot(2,1,2);
plot(t,y);
title('Lowpass Filtered Signal')
%y=conv(b,x);
%figure
%plot(t,y(1:101));


%生成Verilog仿真所需的ROM初始化文件

%temp=single(x);
%temp=num2hex(temp);
%fid=fopen('data.txt','wt');
%fprintf(fid,'%s\n','@00'); 
%for i=1:length(temp)
%fprintf(fid,'%s\n',temp(i,:) );
%end
%fclose(fid);

temp=(x*1000);
temp(find(temp<0))=temp(find(temp<0))+2^32;
temp=uint32(temp);
temp=dec2hex(temp);
fid=fopen('data.txt','wt');
fprintf(fid,'%s\n','@00'); 
for i=1:length(temp)
fprintf(fid,'%s\n',temp(i,:) );
end
fclose(fid);