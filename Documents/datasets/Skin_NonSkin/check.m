function final=check(theta1,theta2)
[data,map]=imread('skinCheck11.jpg');
figure,imshow(data);
final=zeros(size(data));
finalImg=zeros(size(data));
for i=1:size(data,1)
    for j=1:size(data,2)
       
        r=data(i,j,1);
        g=data(i,j,2);
        b=data(i,j,3);
       
        xtest=double([1 b g r]);
        g1=sigmoid(double(xtest*theta1));
        g2=sigmoid(g1*theta2);
        if g2<0.5
            %final(i,j,:)=0;
            %finalImg(i,j,:)=0;
            %{
            final(i,j,1)=r;
            final(i,j,2)=g;
            final(i,j,3)=b;
            %}
        %else
            
            finalImg(i,j,1)=r;
            finalImg(i,j,2)=g;
            finalImg(i,j,3)=b;
            final(i,j,:)=1;
            %final(i,j,:)=1;
        end
    end
end
%segmentedImg=finalImg;
figure,imshow(finalImg);