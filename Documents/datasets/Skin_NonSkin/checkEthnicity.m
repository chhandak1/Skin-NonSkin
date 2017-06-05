function ethnicity=checkEthnicity(final,theta1,theta2)
data=imread('skinCheck11.jpg');
figure,imshow(data);
ethnicity=zeros(size(data));
for i=1:size(data,1)
    for j=1:size(data,2)
        if(final(i,j)==0)
            r=data(i,j,1);
            g=data(i,j,2);
            b=data(i,j,3);

            xtest=double([1 r g b]);
            g1=sigmoid(double(xtest*theta1));
            g2=sigmoid(g1*theta2);
            if g2>0.5
                ethnicity(i,j,:)=1;
                %{
                final(i,j,1)=r;
                final(i,j,2)=g;
                final(i,j,3)=b;
                %}
            else
                ethnicity(i,j,:)=0;
            end
        else
            ethnicity(i,j,:)=0.5;
        end       
    end
end
segmentedImg=ethnicity;
figure,imshow(segmentedImg);