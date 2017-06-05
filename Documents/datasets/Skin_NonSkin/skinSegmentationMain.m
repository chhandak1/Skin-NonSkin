clc 
clear all
X=load('Skin_NonSkin.txt');
n=size(X,2);
m=size(X,1);%m=size(x,1);

x=X(:,1:(n-1));
x = [ones(size(x,1),1) x];   %Adding Bias value
y=X(:,n);   
pos1=find(y==1);
y(pos1)=0;
pos2=find(y==2);
y(pos2)=1;

n=size(x,2);
[xtrain,ytrain,xtest,ytest]=trainTest(x,y,m,n);
m=size(xtrain,1);
neurons=5;
outIters=2;
sumSuccess=0;
max=0;
for i=1:outIters
    theta1=-1+2*rand(n,neurons);
    theta2=-1+2*rand(neurons,1);
    inIters=2500;
    error=zeros(inIters,1);
    g1=zeros(size(xtrain,1),neurons);
    g2=zeros(neurons,1);
    for i=1:inIters
        %theta1
        %theta2
        [g1,g2]=feedforward(xtrain,theta1,theta2);
        [theta1,theta2]=backpropagation(g1,g2,theta1,theta2,xtrain,ytrain);
        error(i)=sum((ytrain-g2).^2); %Mean Square Error Calculation
        
    end
    
    figure,plot(error);
    [g2test,h,success]=testfunc(theta1,theta2,xtest,ytest);
    final=check(theta1,theta2);
    %ethnicityClassificationNewMain(final)
    sumSuccess=sumSuccess+success;
    if(success>max)
        max=success;
        theta2_final=theta2;
        theta1_final=theta1;
        plot(error);
        hold on;
    end
end
%grayscaleImg=check(theta1,theta2);
%avgSuccess=sumSuccess/outIters;
%fprintf('Average succes rate:%f',avgSuccess);
    
