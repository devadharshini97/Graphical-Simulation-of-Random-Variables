
function [probab,almost_sure_con, mean_square_con, dist,T] = exponential_convergence()
clear all
M = 500;
N = 2000;
epsilon=0.05;
for i = 1: M
expo_transform = exprnd(0.5,1,N);
T(i,1:1:N) = transformation(expo_transform);
end
T_mean=mean(T);
%Convergence in Probability
for n = 1:N
count = 0;
    for m = 1:M
        if ((T(m,n)-0.5) > epsilon) ||((T(m,n)-0.5) < (-1*epsilon))
        count = count + 1;
        end
    end 
probab(1,n)= count/M;
end
%Almost Sure Convergence 
for nx = 1:(N/2)
count = 0;   
    for m = 1 : M
        for ny = nx : N
            if ((T(m,ny)-0.5) > epsilon) 
            count= count + 1;
            break;
            elseif ((T(m,ny)- 0.5) < (-1*epsilon))
            count = count + 1;
            break;
            end
        end
    end  
almost_sure_con(1,nx)= count/M;
end
%Mean Square Convergence 
mean_square_con = sum((T-0.5).^2)/M;
%Convergence in Distribution
dist = 0:0.00001:2;
n = N;
for q = 1 :length(dist)
dummy = 0;
    for m1 = 1: M
        if (T(m1,n)) <= dist(q)
        dummy = dummy + 1;
        end
    end
dist(1,q) = dummy/M;
end
end