function [U,L,metric]=gradGGBPL(var,ngmar,n,num,r,varK)
  [Xtemp,temp]=krob2(var,n,num,ngmar);
  temp=temp+eye(size(temp)); % alpha_i=1.


  %% GGBPL: construct the metric matrix from the block quadratic structure.
  epsM=1e-10;
  metricW=sum(temp,2)'+epsM;


  %% GGBPL: calculate the Euclidean gradient of the current block.
  mar=var{n}*temp-Xtemp;


  %% GGBPL: calculate the gradient step under the nonstandard inner product.
  U=var{n}-(1/r)*(mar./metricW);


  %% GGBPL: return the metric information for the weighted proximal operator.
  L=max(metricW);
  metric.type=1;
  metric.w=metricW;
end