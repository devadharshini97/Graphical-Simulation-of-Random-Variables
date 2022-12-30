clc
clear all
close all
mean_value=2;
st_dev=sqrt(2);
j = 0;
l=0;
for i=[100 1000 10000]

%matlab routines    
normal_1 = st_dev.*randn(1,i)+mean_value;
sum(1)=normal_1(1);
y(1)=sum(1);
for j=2:i
    sum(j)=(sum(j-1)+normal_1(j));
    y(j)=sum(j)/j;
end
l=1+l;
x_mean(l) = mean(normal_1);
x_variance(l) = var(normal_1);
y_mean(l) = mean(y);
y_variance(l) = var(y);

figure(l)
histogram(y)
xlabel('Random Variable (X)');
ylabel('PDF(f(x))');
title(['Normal Distribution N = ' num2str(i)])
axis tight
axis 'auto y'
axis 'auto x'
end