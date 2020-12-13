skin=load('CaucasianNonCaucasianData.txt')
r=randperm(4000);
testpos=r(1:20);
xtest=skin(testpos,1:3);
ytest=skin(testpos,4);
k=find(ytest==0);
ytest(k)=-1;

theta1=load('thetaEthnicity1.txt');
theta2=load('thetaEthnicity2.txt');

g1=tansig(double(xtest*theta1));
g2=tansig(g1*theta2);

output=zeros(size(g2));

pos=find(g2>=0);
output(pos)=1;

neg=find(g2<0);
output(neg)=-1;

accuracy=sum(abs((ytest-output))/2)

%{
if g2>0
    ethnicity(i,j,:)=1;
else
    ethnicity(i,j,:)=0;
end
%[data,map]=imread('skinCheck11.jpg');
%figure,imshow(data);
ethnicity=zeros(size(data));
for i=1:size(data,1)
    for j=1:size(data,2)
        if(final(i,j)==1)
            r=data(i,j,1);
            g=data(i,j,2);
            b=data(i,j,3);

            xtest=double([r g b]);
            g1=logsig(double(xtest*theta1));
            g2=logsig(g1*theta2);
            if g2>0.5
                ethnicity(i,j,:)=1;
            else
                ethnicity(i,j,:)=0;
            end
        else
            ethnicity(i,j,:)=0.5;
        end       
    end
end
%}