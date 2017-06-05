%{
pos0=find(skinColorNew(:,4)==0);
skinColorNew1(pos0,1:3)=skinColorNew(pos0,1:3);
skinColorNew1(pos0,4)=1;
skinColorNew1(pos0,5)=0;
skinColorNew1(pos0,6)=0;


pos1=find(skinColorNew(:,4)==1);
skinColorNew1(pos1,1:3)=skinColorNew(pos1,1:3);
skinColorNew1(pos1,4)=0;
skinColorNew1(pos1,5)=1;
skinColorNew1(pos1,6)=0;
%}

pos2=find(skinColorNew(:,4)==2);
skinColorNew1(pos2,1:3)=skinColorNew(pos2,1:3);
skinColorNew1(pos2,4)=0;
skinColorNew1(pos2,5)=0;
skinColorNew1(pos2,6)=1;
