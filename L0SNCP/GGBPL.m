%%  All parameters of this function are explained the same as 'main_Run_me' and 'ALGOchoose' functions
function [var,loss,timerun,bts,reloss]=GGBPL(var,ngmar,aa,maxiteropt,stopindex)
%% initialization algorithm
loss=[];
reloss=[];
timerun=[0];
num=length(size(ngmar));
N=size(var{1},2);
for i=1:num
    varze{i}=zeros(size(var{i}));
end
% rho=1;
LK=zeros(1,num);
L=ones(1,num);
tk=(1+sqrt(5))/2;
r=1.01;
bts=[];
wk=zeros(1,num);
varK=var;
[loss(1),reloss(1)]=compute(var,ngmar);
returnloss=norm(ngmar)^2;









t1=clock;


for i=1:maxiteropt
%% update parameters
fprintf("%d\n",i);


    varK=var;

    for j=1:num





    %% Judging whether to extrapolate

        

        LK(j)=L(j);
        [V,L(j),metric]=gradGGBPL(var,ngmar,j,num,r,varK);
        var{j}=PROXGGBPL(varze{j},V,aa(j),metric);
    end
    








[loss(i+1),reloss(i+1)]=compute(var,ngmar);






bts{i}=wk;
t2=clock;
timerun(i+1)=etime(t2,t1);
fprintf("GGBPL\n");

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


