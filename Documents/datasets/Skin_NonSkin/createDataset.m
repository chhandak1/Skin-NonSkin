pos1=find(data(:,4)==2);
diff=pos1(size(pos1,1))-pos1(1);
randomPos=randperm(diff);
finRandomPos=pos1(1)+randomPos;
pos=finRandomPos(1:4000);
bgPixels=data(pos,1:3);
bgPixelsTemp=bgPixels(:,1);
bgPixels(:,1)=bgPixels(:,3);
bgPixels(:,3)=bgPixelsTemp;
bgPixels(:,4)=2;
skinColorNew=[skinColor;bgPixels];