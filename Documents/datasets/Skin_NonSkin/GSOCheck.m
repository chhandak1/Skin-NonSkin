clc 
clear all
thetaGso=-1+2*rand(20,1);


%thetaPso1=reshape(thetaPso(1:20),[4,5]);
%thetaPso2=reshape(thetaPso(21:26),[6,1]);
X=load('CaucasianNonCaucasianData.txt');
x = X(:,1:3);
%x = [ones(size(x,1),1) x];
y=X(:,4);
pos=find(y==0);
y(pos)=-1;

m=size(X,1);
n=size(X,2);
[xtrain,ytrain,xtest,ytest]=trainTest(x,y,m,n);
[galaxy_x,best_cost,errorGSO]=nmgso(@(thetaGso)MSECost(thetaGso,xtrain,ytrain),20);
