%% Proximal projection function
function [X,IX]=PROX(X,U,a)
% tic
S=U(:);
X1=X;
[~,IX] = sort(S(:),'descend');
if(a>length(IX))
    a=length(IX);
end
X(IX(1:a))=U(IX(1:a));
X(X<0)=0;
% toc

% tic
% [~,index]=maxk(U(:),a);
% X1(index)=U(index);
% X1(X1<0)=0;
% toc

end

