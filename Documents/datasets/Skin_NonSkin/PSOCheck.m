clc 
clear all
thetaPso=-1+2*rand(1940,1);


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

[GlobalBest,errorPSO]=pso(thetaPso,xtrain,ytrain);
%g1=sigmoid(double(xtest*thetaPso1));
%g1 = [ones(size(g1,1),1) g1];
%g2=sigmoid(g1*thetaPso2);
thetaPso=GlobalBest.Position;
thetaPso1=reshape(thetaPso(1:15),[3,5]);
thetaPso2=reshape(thetaPso(16:20),[5,1]);
g1=tansig(double(xtest*thetaPso1));
%g1 = [ones(size(g1,1),1) g1];
g2=tansig(g1*thetaPso2);
for i=1:size(g2,1)
    if g2(i)>0
        finalPSO(i)=1;
    else
        finalPSO(i)=-1;
    end
end