%% Input.
% var         : Initial matrix
% ngmar       : Decomposed matrix
% aa          : Maximum number of non-zero elements for each decomposition matrix
% The remaining parameters are explained the same as the 'main_Run_me' function

%% Output.
% vars:       : Decomposition matrix resulting from the final iterative result
% loss:       : Array of loss functions generated during iteration
% tr:         : Runtime array during iteration
% btss and atz: An array of extrapolated parameters produced by each algorithm during iteration,
%             : where btss represents the array of additional extrapolated parameters for algorithms, 
%             : and 'atz' represents the array of additional extrapolated parameters for IBPG and iPALM
%% An Accelerated Block Proximal method with Adaptive Momentum for Nonconvex and Nonsmooth Optimization

function [data,varss]=ALGOchoose(var,ngmar,aa,maxiteropt,bt,flag,stopindex,r,t,btmax)
if(flag==0)
[vars,loss,tr,bts,reloss]=PALM(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;


elseif(flag==1) 
% [vars,loss,tr,bts,ats]=IPALM(var,ngmar,aa,maxiteropt,stopindex);
% varss=vars;
% lossdata=loss;
% trdata=tr;
% btss=bts;
% atss=ats;

[vars,loss,tr,bts,reloss]=PALM(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;

elseif(flag==2)
[vars,loss,tr,bts,reloss]=BPL(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;


elseif(flag==3) 
[vars,loss,tr,bts,ats,reloss]=IBPG(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;
atss=ats;




elseif(flag==4) 
[vars,loss,tr,bts,reloss]=TITAN(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;




elseif(flag==5)
[vars,loss,tr,bts,reloss]=ABPL(var,ngmar,aa,maxiteropt,bt,2,stopindex,r,t,btmax); %%ABPL-random and ABPL+-random
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;

elseif(flag==6)
[vars,loss,tr,bts,reloss]=PGels(var,ngmar,aa,maxiteropt,stopindex,r);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;


elseif(flag==7) 
[vars,loss,tr,bts,reloss]=APGL(var,ngmar,aa,maxiteropt,stopindex,btmax,1);
varss{1}=vars;
lossdata=loss;
trdata=tr;
btss=bts;


elseif(flag==8)
[vars,loss,tr,bts,reloss]=GGBPL(var,ngmar,aa,maxiteropt,stopindex);
varss{1}=vars;
lossdata=loss;
trdata=tr;
btss=bts;

elseif(flag==9)
[vars,loss,tr,bts,reloss]=iGGBPL(var,ngmar,aa,maxiteropt,stopindex);
varss=vars;
lossdata=loss;
trdata=tr;
btss=bts;

end











data{1}=lossdata;
data{2}=trdata;
data{3}=btss;
data{4}=reloss; % Reconstruction loss without the regularization terms.

end



