function [g2test,h,success]=testfuncOptimize(theta,xtest,ytest)
theta1=reshape(theta(1:15),[3,5]);
theta2=reshape(theta(16:20),[5,1]);
g1=tansig(xtest*theta1);
%g1 = [ones(size(g1,1),1) g1];
g2test=tansig(g1*theta2);

h=ones(size(g2test));
count=0;
pos1=find(g2test<0);
h(pos1)=-1;

posMatch=find(ytest==h);
count=size(posMatch,1);
success=count/size(ytest,1)*100;
fprintf('Success ratio:%f\n',success);

