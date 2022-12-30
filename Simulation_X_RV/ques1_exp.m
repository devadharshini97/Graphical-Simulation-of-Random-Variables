clc
clear all
close all
lambda=2;
mean_value=1/2;

j = 0;
for i=[100 1000 10000]

%matlab routines    
exp_1 = exprnd(0.5,1,i);
j =1+j;
figure(j)
subplot(1,2,1);
histogram(exp_1)
xlabel('Random Variable (X)');
ylabel('PDF(f(x))');
title({'Matlab Routine';['Exponential Distribution N = ' num2str(i)]})
fprintf('Mean of %i Random variables is %i \n',i,mean(exp_1));
fprintf('Variance of %i Random variables is %i \n',i,var(exp_1));

%rejection method
 normal_2 = zeros(1,i);
 for n=1:i
     not_reject = false;
     while not_reject == false
         u=rand();
         v=(4).*rand();
         if u <= lambda*exp(-v*lambda)
             exp_2(n)=v;
             not_reject=true;
         end
     end
 end

subplot(1,2,2);
histogram(exp_2)
xlabel('Random Variable(X)');
ylabel('PDF (f(x))');
title({'Rejection Method';['Exponential Distribution N =' num2str(i)]})
fprintf('Mean of %i Random variables-rejection is %i \n',i,mean(exp_2));
fprintf('Variance of %i Random variables-rejection is %i \n',i,var(exp_2));

end