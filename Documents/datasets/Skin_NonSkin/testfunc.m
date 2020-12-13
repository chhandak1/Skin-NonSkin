function [g2test,h,success]=testfunc(theta1,theta2,xtest,ytest)

g1=sigmoid(xtest*theta1);
g2test=sigmoid(g1*theta2);

h=zeros(size(g2test));
count=0;
pos1=find(g2test>0.5);
h(pos1)=1;

posMatch=find(ytest==h);
count=size(posMatch,1);
success=count/size(ytest,1)*100;
fprintf('Success ratio:%f\n',success);

