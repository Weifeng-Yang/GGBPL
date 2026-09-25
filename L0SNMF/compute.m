%% Calculate the value of the objective function
function [loss,reloss]=compute(var,num,ngmar)
    nga=var{1};
    for i=2:num
        nga=nga*var{i};
    end
    loss=0.5*norm(ngmar-nga,'fro')^2;
reloss=loss;
% alpha_i=1 for all factors.
for j=1:length(var)
    loss=loss+0.5*norm(var{j},'fro')^2;
end
end