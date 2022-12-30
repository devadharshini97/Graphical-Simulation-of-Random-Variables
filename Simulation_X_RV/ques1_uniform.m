clc
clear all
close all
j = 0;
for i=[100 1000 10000]

%matlab routines    
uniform_1 = rand(1,i)*2+2;
j =1+j;
figure(j)
subplot(1,2,1);
histogram(uniform_1)
xlabel('Random Variable(X)');
ylabel('PDF(f(x))');
title({'Matlab Routine';['Uniform Distribution N = ' num2str(i)]})
fprintf('Mean of %i Random variables is %i \n',i,mean(uniform_1));
fprintf('Variance of %i Random variables is %i \n',i,var(uniform_1));

%rejection method
 uniform_2 = zeros(1,i);
 for n=1:i
     not_reject = false;
     while not_reject == false
         u=randn();
         v=rand();
         if u <= 1
             uniform_2(n)=v;
             not_reject=true;
         end
     end
 end
 
subplot(1,2,2);
histogram(uniform_2*2+2)
xlabel('Random Variable X','fontsize',12);
ylabel('Probability Density Function (f(x))','fontsize',12);
title({'Rejection Method';['Uniform Distribution N =' num2str(i)]})
fprintf('Mean of %i Random variables-rejection is %i \n',i,mean(uniform_2*2+2));
fprintf('Variance of %i Random variables-rejection is %i \n',i,var(uniform_2*2+2));

end