clc
clear all
close all

l = 0;
for i=[100 1000 10000]
sum=[];
y=[];
%matlab routines    
uniform_1 = rand(1,i)*2+2;
sum(1)=uniform_1(1);
y(1)=sum(1);
for j=2:i
    sum(j)=(sum(j-1)+uniform_1(j));
    y(j)=sum(j)/j;
end
l=1+l;
x_mean(l) = mean(uniform_1);
x_variance(l) = var(uniform_1);
y_mean(l) = mean(y);
y_variance(l) = var(y);

figure(l)
histogram(y)
xlabel('Random Variable (X)');
ylabel('PDF(f(x))');
title(['Uniform Distribution N = ' num2str(i)])
axis tight
axis 'auto y'
axis 'auto x'
end