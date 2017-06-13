function [deriv]=derivSigmoid(x)

deriv=(1+x).*(1-x);

end