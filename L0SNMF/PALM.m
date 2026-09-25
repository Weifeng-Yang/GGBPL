%%  All parameters of this function are explained the same as 'main_Run_me' and 'ALGOchoose' functions
%%  This algorithm comes from the paper: "Proximal alternating linearized minimization for nonconvex and nonsmooth problems"
function [var,loss,timerun,bts,reloss]=PALM(var,ngmar,aa,maxiteropt,stopindex,r)
%% initialization algorithm
loss=[];
reloss=[];
timerun=[0];
num=length(var);
for i=1:num
    varze{i}=zeros(size(var{i},1),size(var{i},2));
end
bts=0;
[loss(1),reloss(1)]=compute(var,num,ngmar);
returnloss=norm(ngmar,"fro")^2;


t1=clock;
for i=1:maxiteropt
fprintf("%d\n",i);



%% update parameters
for j=1:num
V{j}=grad(var,ngmar,j,num,r);
[var{j},~]=PROX(varze{j},V{j},aa(j));
end
[loss(i+1),reloss(i+1)]=compute(var,num,ngmar);
t2=clock;
timerun(i+1)=etime(t2,t1);


%% Check if termination condition is met
fprintf("PALM\n");
for j=1:num
    fprintf("nonzero:%d\n",nnz(var{j}));
end
ReeK=loss(i)/returnloss;
Ree=loss(i+1)/returnloss;
Res=abs(Ree-ReeK);
fprintf("Rel：%d\n",Res);
stop=stopcheck(timerun,stopindex);
if(stop==1)
    fprintf("Number of terminations：%d\n",i);
    pause(4);
    break;
end
end

end




