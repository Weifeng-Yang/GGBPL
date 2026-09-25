%%  All parameters of this function are explained the same as 'main_Run_me' and 'ALGOchoose' functions
function [var,loss,timerun,bts,reloss]=iGGBPL(var,ngmar,aa,maxiteropt,stopindex)
%% initialization algorithm
loss=[];
reloss=[];
timerun=[0];
num=length(size(ngmar));
for i=1:num
    varze{i}=zeros(size(var{i}));
end
r=1.01;
LK=zeros(1,num);
L=ones(1,num);
tk=1;
rho1=10^-10;
bts=[];
bt=0;
varK=var;
varK1=var;

[loss(1),reloss(1)]=compute(var,num,ngmar);
returnloss=norm(ngmar,"fro")^2;










t1=clock;




for i=1:maxiteropt
%% update parameters
fprintf("%d\n",i);
vv=var;






    



%% Update parameters
    for j=1:num
        vv{j}=var{j}+bt*(var{j}-varK1{j});
        LK(j)=L(j);
        [V,L(j),metric]=gradGGBPL(vv,ngmar,j,num,r,varK);
        var{j}=PROXGGBPL(varze{j},V,aa(j),metric);
        metrics{j}=metric;
        vv{j}=var{j};
    end


  metricgap=iGGBPLmetricgap(var,varK,metrics,num);
  
   
    

    [loss(i+1),reloss(i+1)]=compute(var,num,ngmar);


    %% Judging whether to extrapolate
    if(loss(i+1)>loss(i)-rho1*metricgap)
    var=varK;
    bt=0;

        for j=1:num

            LK(j)=L(j);
            [V,L(j),metric]=gradGGBPL(var,ngmar,j,num,r,varK);
            var{j}=PROXGGBPL(varze{j},V,aa(j),metric);
        end
        [loss(i+1),reloss(i+1)]=compute(var,num,ngmar);

    end

varK1=varK;
varK=var;


bts{i}=bt;

tkOld=tk;
tk=(1+sqrt(1+4*tk^2))/2;
bt=tkOld/tk;

t2=clock;
timerun(i+1)=etime(t2,t1);
fprintf("iGGBPL\n");
%% Check if termination condition is met
for j=1:num
    fprintf("nonzero:%d\n",nnz(var{j}~=0));
end
ReeK=loss(i)/returnloss;
Ree=loss(i+1)/returnloss;
Res=abs(Ree-ReeK);
fprintf("cri：%d\n",Res);
stop=stopcheck(timerun,stopindex);
if(stop==1)
    fprintf("Number of terminations：%d\n",i);
    pause(4);
    break;
end

end

end









function metricgap=iGGBPLmetricgap(var,varK,metrics,num)

metricgap=0;

for j=1:num
    gap=var{j}-varK{j};

    if(metrics{j}.type==1)
        metricgap=metricgap+sum(sum(gap.^2 .* metrics{j}.w));
    elseif(metrics{j}.type==3)
        metricgap=metricgap+sum(sum(gap.^2 .* metrics{j}.w));
    else
        metricgap=metricgap+sum(sum(gap.^2 .* (metrics{j}.left * metrics{j}.right+1)));
    end
end

end

