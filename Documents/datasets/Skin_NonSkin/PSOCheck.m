pso;
thetaPso=GlobalBest.Position;
thetaPso1=reshape(thetaPso(1:20),[4,5]);
thetaPso2=reshape(thetaPso(21:26),[6,1]);
X=load('Skin_NonSkin.txt');
xtest=X(:,1:3);
xtest = [ones(size(xtest,1),1) xtest];
g1=sigmoid(double(xtest*thetaPso1));
g1 = [ones(size(g1,1),1) g1];
g2=sigmoid(g1*thetaPso2);
for i=1:size(g2,1)
    if g2(i)>0.5
        finalPSO(i)=1;
    else
        finalPSO(i)=0;
    end
end