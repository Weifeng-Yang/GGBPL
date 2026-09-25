clearvars -except rundatas
clc


%% Parameter settings
rng('shuffle')
warning('off');
dimensions=[300,400,500]; 
index=[3];
maxiteropt=40000;
r=1.1;
bt=0.6;
at=1.5*bt;
t=1.1;
btmax=0.9999;
outer=20;
trigger=[1,2,3,4,5,6,7,8,9];
percent=0.3;
stopindex=1;



for iter=1:length(dimensions)

dimension=dimensions(iter);
    
[ngmar,dimension]=readfile(index,dimension);
for i=1:length(dimension)-1
    pere(i)=dimension(i)*dimension(i+1)*percent;
end
aa=pere;
num=length(dimension)-1;

% tdatass=rundatas(iter);
% tdatass=tdatass{1};

for j=1:outer

% var=tdatass{j};
% var=var{end};


for i=1:num
%     var{i}=sprand(dimension(i),dimension(i+1),aa(i)/(2*dimension(i)*dimension(i+1)));
    var{i}=sprand(dimension(i),dimension(i+1),aa(i)+1);
    var{i}=full(var{i});
end


for i=1:length(trigger)       
[datas{i},vars{i}]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,trigger(i),stopindex,r,t,btmax);
end
datas{length(trigger)+1}=var;

datass{j}=datas;
end

Fdatas{iter}=datass;
end

% % Drawing
% plt=plotplt(datas,trigger);
index=3;
dimsions=[300,400,500];
[ngmar,dimension]=readfile(3,dimsions(index));
[lossrecord,~,~,relrecord]=valueplot(Fdatas{index},30,trigger);
Obj=(sum(lossrecord)/length(lossrecord))';
ObjErr=std(lossrecord,0,1)';
temp=sqrt(relrecord*2)/norm(ngmar,'fro');
Rel=(sum(temp)/length(temp))';
RelErr=std(temp,0,1)';
[~,ranking]=min(temp,[],2);
ranking=tabulate(ranking);
 
clearvars -except Fdatas

filename = "Fdatass.mat";
save(filename)
 
 
 



