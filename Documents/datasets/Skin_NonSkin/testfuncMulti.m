function [g2test,h,success]=testfuncMulti(theta1,theta2,xtest,ytest)

g1=sigmoid(xtest*theta1);
g2test=sigmoid(g1*theta2);

h=zeros(size(g2test));
count=0;

for i=1:size(xtest,1)
    if((g2test(i,1)>=g2test(i,2))&&(g2test(i,1)>=g2test(i,2)))
        h(i,1)=1;
        h(i,2)=0;
        h(i,3)=0;
    elseif((g2test(i,2)>g2test(i,1))&&(g2test(i,2)>=g2test(i,3)))
        h(i,1)=0;
        h(i,2)=1;
        h(i,3)=0;
    elseif((g2test(i,3)>g2test(i,1))&&(g2test(i,3)>g2test(i,2)))
        h(i,1)=0;
        h(i,2)=0;
        h(i,3)=1;
    end
    
end
for i=1:size(ytest,1)
    for j=1:size(ytest,2)
        if((ytest(i,j)==1)&&(h(i,j)==1))
            count=count+1;
        end
    end
end

%posMatch=find(ytest==h);
%count=size(posMatch,1);
success=count/(size(ytest,1))*100;
fprintf('Success ratio:%f\n',success);

