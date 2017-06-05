clear all
clc
%Detect objects using Viola-Jones Algorithm

%To detect Face
FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('skinCheck9.jpg');

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
end
%{
for i=1:size(BB,1)
    for j=BB(i,1):BB(i,1)+BB(i,3)
        for j=BB(i,2):BB(i,2)+BB(i,4)
            face(i)
%}
theta1=load('theta1.txt');
theta2=load('theta2.txt');
for i=1:size(BB,1)
    face=imcrop(I,BB(i,:));
    %classifyEthnicity(face);
    figure,imshow(face);
    skinNonSkinInference(face,theta1,theta2);
end

%title('Face Detection');
hold off;
