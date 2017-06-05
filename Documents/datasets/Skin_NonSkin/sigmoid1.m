function g = sigmoid1(z)
%z=xtrain*theta1;
g=zeros(size(z));
for i=1:size(z,1)
    for j=1:size(z,2)
        g(i,j) = 1.0 / (1.0 + exp(-z(i,j)));
    end
end
end
