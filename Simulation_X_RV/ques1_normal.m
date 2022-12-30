clc
clear all
close all
mean_value=2;
st_dev=sqrt(2);
j = 0;
for i=[100 1000 10000]

%matlab routines    
normal_1 = st_dev.*randn(1,i)+mean_value;
j =1+j;
figure(j)
subplot(1,2,1);
histogram(normal_1)
xlabel('Random Variable(X)');
ylabel('PDF (f(x))');
title({'Matlab Routine';['Normal Distribution N = ' num2str(i)]})
fprintf('Mean of %i Random variables is %i \n',i,mean(normal_1));
fprintf('Variance of %i Random variables is %i \n',i,var(normal_1));

%rejection method
 normal_2 = zeros(1,i);
 for n=1:i
     not_reject = false;
     while not_reject == false
         u=rand();
         v=(12).*rand()-4;
         if u <= exp(-(v-2)^2/4)
             normal_2(n)=v;
             not_reject=true;
         end
     end
 end

subplot(1,2,2);
histogram(normal_2)
xlabel('Random Variable (X)');
ylabel('PDF(f(x))');
title({'Rejection Method';['Normal Distribution N =' num2str(i)]})
fprintf('Mean of %i Random variables-rejection is %i \n',i,mean(normal_2));
fprintf('Variance of %i Random variables-rejection is %i \n',i,var(normal_2));

end