clearvars -except rundatas
clc

%% Parameter settings
warning('off');
rng('shuffle')
R=[50,60,70];
index=3;
r=1.1;
bt=0.2;
at=1.01*bt;
t=1.3;
btmax=0.9999;
outer=20;
maxiteropt=6000000;
trigger=[1,2,3,4,5,6,7,8,9];
percent=0.3;
stopindex=3;





%% Algorithm iteration starts

[ngmar,num]=readfile(index);
ngmar=tensor(ngmar);


for iter=1:length(R)

N=R(iter);
for i=1:length(size(ngmar))
    pere(i)=N*size(ngmar,i)*percent;
end
aa=pere;




for j=1:outer
% 

for i=1:num
    den=size(ngmar,i)*N;
    var{i}=sprand(size(ngmar,i),N,aa(i)/(2*den));
    var{i}=full(var{i});
end


for i=1:length(trigger)
[datas{i},vars{i}]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,trigger(i),stopindex,r,t,btmax,10^-10);
end
datas{length(trigger)+1}=var;
datass{j}=datas;
end

Fdatas{iter}=datass;
end



% 
%% Drawing
% plt0=plotplt(datas,trigger);
index=1;
dimsions=[50,60,70];
[ngmar,dimension]=readfile(3);
[lossrecord,~,~,relrecord]=valueplot(Fdatas{index},40,trigger);
Obj=(sum(lossrecord)/length(lossrecord))';
ObjErr=std(lossrecord,0,1)';
temp=sqrt(relrecord*2)/norm(tensor(ngmar));
Rel=(sum(temp)/length(temp))';
RelErr=std(temp,0,1)';
[~,ranking]=min(temp,[],2);
ranking=tabulate(ranking);


filename = "PNW-Fdatass.mat";
save(filename,"Fdatas")
% 
% clearvars -except Fdatas
% 
% filename = "Fdatas.mat";
% save(filename)




