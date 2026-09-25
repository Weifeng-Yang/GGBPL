%% Gradient calculation function for GGBPL, iGGBPL
function [U,L,metric]=gradGGBPL(var,ngmar,n,num,r,varK)
    if(n>1)
    Z=eye(size(var{1},1),size(var{1},1));
    end
    if(n<num)
    ZT=eye(size(var{n+1},1),size(var{n+1},1)); 
    end
    for i=1:n-1
        Z=Z*var{i};
    end
    for i=n+1:num
        ZT=ZT*var{i};
    end 
    


    epsM = 1e-10;





    if(n==1)
    mar=var{n}*ZT;

    metricW = sum(ZT*ZT',2)' + 1 + epsM;
    metricW = checkck(metricW);

    pgrad=(mar-ngmar)*ZT'+var{n};

    U = var{n} - (1/r) * (pgrad ./ metricW);

    L = max(metricW);

    metric.type = 1;
    metric.w = metricW;

    elseif(n<num)

    mar=Z*var{n}*ZT;
    pgrad=Z'*(mar-ngmar)*(ZT)'+var{n};

        metricLeft = sum(Z'*Z,2) + epsM;
        metricRight = sum(ZT*ZT',2)' + epsM;

        metricLeft = checkck(metricLeft);
        metricRight = checkck(metricRight);


   
        L = max(metricLeft) * max(metricRight)+1;


    U = var{n} - (1/r) * (pgrad ./ (metricLeft * metricRight+1));

    metric.type = 2;
    metric.left = metricLeft;
    metric.right = metricRight;


    elseif(n==num)

    mar=Z*var{n};
    pgrad=Z'*(mar-ngmar)+var{n};

         metricW = sum(Z'*Z,2) + 1 + epsM;
        metricW = checkck(metricW);

        U = var{n} - (1/r) * (pgrad ./ metricW);

        L = max(metricW);

    metric.type = 3;
    metric.w = metricW;


    end

end


