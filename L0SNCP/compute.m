%% Calculate the value of the objective function
function [loss,reloss]=compute(var,ngmar)
X=ktensor(var);
S=tensor(X);
loss=norm(ngmar-S)^2/2;
reloss=loss;
% alpha_i=1 for all factors.
for j=1:length(var)
    loss=loss+0.5*norm(var{j},'fro')^2;
end
end

