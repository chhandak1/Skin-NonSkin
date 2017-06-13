function [g2test,h,success]=testfunc(theta1,theta2,xtest,ytest)

g1=tansig(xtest*theta1);
g2test=tansig(g1*theta2);

h=ones(size(g2test));
count=0;
pos1=find(g2test<0);
h(pos1)=-1;

posMatch=find(ytest==h);
count=size(posMatch,1);
success=count/size(ytest,1)*100;
fprintf('Success ratio:%f\n',success);

