function final=checkMulti(theta1,theta2)
data=imread('skinCheck4.jpg');
figure,imshow(data);
final=zeros(size(data));
for i=1:size(data,1)
    for j=1:size(data,2)
       
        r=data(i,j,1);
        g=data(i,j,2);
        b=data(i,j,3);
       
        xtest=double([1 r g b]);
        g1=sigmoid(double(xtest*theta1));
        g2=sigmoid(g1*theta2);
        if (g2(1)>=g2(2))&&(g2(1)>=g2(3))
            final(i,j,:)=1;
            %{
            final(i,j,1)=r;
            final(i,j,2)=g;
            final(i,j,3)=b;
            %}
        elseif((g2(2)>g2(1))&&(g2(2)>=g2(3)))
            final(i,j,:)=0.5;
        elseif((g2(3)>g2(2))&&(g2(3)>g2(1)))
            final(i,j,:)=0;
        end
    end
end
segmentedImg=final;
figure,imshow(segmentedImg);