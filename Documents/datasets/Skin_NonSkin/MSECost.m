function error=MSECost(thetaPso,xtrain,ytrain)
thetaPso1=reshape(thetaPso(1:15),[3,5]);
thetaPso2=reshape(thetaPso(16:20),[5,1]);
g1=tansig(double(xtrain*thetaPso1));
%g1 = [ones(size(g1,1),1) g1];
g2=tansig(g1*thetaPso2);
n=size(ytrain,1);
error=sum((g2-ytrain).^2)/n;

