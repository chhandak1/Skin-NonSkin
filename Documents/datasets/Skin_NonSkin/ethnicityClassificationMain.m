
%X=load('Skin_NonSkin.txt');
x1=skinColor(:,1:3);
x = [ones(size(x1,1),1) x1];   %Adding Bias value
y=skinColor(:,4:6);   

m=size(x,1);
n=size(x,2);
[xtrain,ytrain,xtest,ytest]=trainTestMultivariate(x,y,m,n);
neurons=8;
outIters=1;
sumSuccess=0;
max=0;
%cost=@(x)sum(x.^2);
%[x_optimal,cost_optimal] = nmgso(cost,59);
[theta, cost] = ...
	nmgso(@(t)(costFunction(t, x, y)), 59);
%{
for j=1:outIters
    
    theta1=-1+2*rand(4,neurons);
    theta2=-1+2*rand(neurons,3);
    inIters=500;
    error=zeros(inIters,1);
    g1=zeros(size(xtrain,1),neurons);
    g2=zeros(neurons,3);
    
    for i=1:inIters

        [g1,g2]=feedforward(xtrain,theta1,theta2);
        [theta1,theta2]=backpropagationMultiVariate(g1,g2,theta1,theta2,xtrain,ytrain);
        %error(j)=sum((ytrain-g2).^2); %Mean Square Error Calculation
        
    end
    
    figure,plot(error);
    [g2test,h,success]=testfuncMulti(theta1,theta2,xtest,ytest);

end
%}
    
