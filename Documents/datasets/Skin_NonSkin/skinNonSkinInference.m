function skinNonSkinInference(data,theta1,theta2)
final=zeros(size(data));
finalImg=zeros(size(data,1),size(data,2),3);
for i=1:size(data,1)
    for j=1:size(data,2)
       
        r=data(i,j,1);
        g=data(i,j,2);
        b=data(i,j,3);
       
        xtest=double([1 b g r]);
        g1=sigmoid(double(xtest*theta1));
        g2=sigmoid(g1*theta2);
        if g2>0.92
            final(i,j,:)=0;
            %{
            finalImg(i,j,1)=r;
            finalImg(i,j,2)=g;
            finalImg(i,j,3)=b;
            
            %}
        else
            final(i,j,:)=1;
        end
    end
end
segmentedImg=final;
figure,imshow(segmentedImg);
checkEthnicity(final,data);