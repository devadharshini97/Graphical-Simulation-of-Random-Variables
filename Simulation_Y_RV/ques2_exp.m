clc
clear all
close all
lambda=2;
mean_value=1/2;
j = 0;
l=0;
for i=[100 1000 10000]

%matlab routines    
exp_1 = exprnd(0.5,1,i);
sum(1)=exp_1(1);
y(1)=sum(1);
for j=2:i
    sum(j)=(sum(j-1)+exp_1(j));
    y(j)=sum(j)/j;
end
l=1+l;
x_mean(l) = mean(exp_1);
x_variance(l) = var(exp_1);
y_mean(l) = mean(y);
y_variance(l) = var(y);

figure(l)
histogram(y)
xlabel('Random Variable (X)');
ylabel('PDF(f(x))');
title(['Exponential Distribution N = ' num2str(i)])
axis tight
axis 'auto y'
axis 'auto x'
end