function ethnicityClassificationNewMain(final)
X=load('CaucasianNonCaucasianData.txt');
n=size(X,2);
m=size(X,1);%m=size(x,1);

x=X(:,1:(n-1));
x = [ones(size(x,1),1) x];   %Adding Bias value
y=X(:,n);   
%pos1=find(y==1);
%y(pos1)=0;
%pos2=find(y==2);
%y(pos2)=1;

n=size(x,2);
[xtrain,ytrain,xtest,ytest]=trainTest(x,y,m,n);
m=size(xtrain,1);
neurons=5;
outIters=2;
sumSuccess=0;
max=0;
for i=1:outIters
    ethnicityTheta1=-1+2*rand(n,neurons);
    ethnicityTheta2=-1+2*rand(neurons,1);
    inIters=6000;
    error=zeros(inIters,1);
    g1=zeros(size(xtrain,1),neurons);
    g2=zeros(neurons,1);
    for i=1:inIters
        %ethnicityTheta1
        %ethnicityTheta2
        [g1,g2]=feedforward(xtrain,ethnicityTheta1,ethnicityTheta2);
        [ethnicityTheta1,ethnicityTheta2]=backpropagation(g1,g2,ethnicityTheta1,ethnicityTheta2,xtrain,ytrain);
        error(i)=sum((ytrain-g2).^2); %Mean Square Error Calculation
        
    end
    
    figure,plot(error);
    [g2test,h,success]=testfunc(ethnicityTheta1,ethnicityTheta2,xtest,ytest);
    ethnicity=checkEthnicity(final,ethnicityTheta1,ethnicityTheta2);
    sumSuccess=sumSuccess+success;
    if(success>max)
        max=success;
        ethnicityTheta2_final=ethnicityTheta2;
        ethnicityTheta1_final=ethnicityTheta1;
        plot(error);
        hold on;
    end
end
%grayscaleImg=check(ethnicityTheta1,ethnicityTheta2);
%avgSuccess=sumSuccess/outIters;
%fprintf('Average succes rate:%f',avgSuccess);
    
