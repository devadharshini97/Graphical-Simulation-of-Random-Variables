function T = transformation(X)
dummy= 0;
for i = 1 :1: length(X)
        s(i) = dummy+ X(i);
        dummy= s(i);
        T(i) = s(i)/i; 
end
end