function [g1,g2]=feedforward(xtrain,theta1,theta2)

g1=tansig(xtrain*theta1);
g2=tansig(g1*theta2);

end

