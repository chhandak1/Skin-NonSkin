%{
clc 
clear all
data=load('Skin_NonSkin.txt');


y=data(:,4);
pos=find(y==1);
skinColor=data(pos,1:3);
temp=skinColor(:,1);
skinColor(:,1)=skinColor(:,3);
skinColor(:,3)=temp;


img1=zeros(400,400,3);
%}
%for z=300:50:50000
    for j=4151:4200
        for i=1:3
            img1(:,:,i)=skinColor(j,i)/256;
            %hold on;
        end
        figure,image(img1)
        axis off
        axis image
    end
%    fprintf('\nPress enter');
%    pause;
%end

