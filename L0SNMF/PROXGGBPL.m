function [X,IX]=PROXGGBPL(X,U,a,metric)

Upos=max(U,0);

if(metric.type==1)
    score=Upos.^2 .* metric.w;
elseif(metric.type==3)
    score=Upos.^2 .* metric.w;
else
    score=Upos.^2 .* (metric.left * metric.right+1);
end

[~,IX]=sort(score(:),'descend');

if(a>length(IX))
    a=length(IX);
end

IX=IX(1:a);
X(:)=0;
X(IX)=Upos(IX);

end