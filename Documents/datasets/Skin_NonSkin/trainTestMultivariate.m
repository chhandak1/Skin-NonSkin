function [xtrain,ytrain,xtest,ytest]=trainTestMultivariate(x,y,m,n)

r1=randperm(m); %Random Permutation
train=floor(0.7*m);

trainpos=r1(1:train);
xtrain=x(trainpos,1:4);
ytrain=y(trainpos,1:3);

testpos=r1(train:m);
xtest=x(testpos,1:4);
ytest=y(testpos,1:3);
