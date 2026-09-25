%% Gradient calculation function for PALM, BPL, ABPL, ABPL+
function [U,L,pgrad,pgradx]=gradBEPL(var,ngmar,n,num,r)
    if(n>1)
    Z=eye(size(var{1},1),size(var{1},1));
    ZX=Z;
    end
    if(n<num)
    ZT=eye(size(var{n+1},1),size(var{n+1},1)); 
    ZTX=ZT;
    end
    for i=1:n-1
        Z=Z*var{i};
    end
    for i=n+1:num
        ZT=ZT*var{i};
    end 
    








    if(n==1)
    ck=norm(ZT*ZT','fro')+1;
    ck=checkck(ck);
    mar=var{n}*ZT;

    pgrad=(mar-ngmar)*ZT'+var{n};




    U=var{n}-1/(r*ck)*pgrad; 
    elseif(n<num)
    ck=norm(Z'*Z,'fro')*norm(ZT*ZT','fro')+1;
    ck=checkck(ck);
    mar=Z*var{n}*ZT;
    pgrad=Z'*(mar-ngmar)*(ZT)'+var{n};



    U=var{n}-1/(r*ck)*pgrad;  
    elseif(n==num)
    ck=norm(Z'*Z,'fro')+1;
    ck=checkck(ck);
    mar=Z*var{n};
    pgrad=Z'*(mar-ngmar)+var{n};




    U=var{n}-1/(r*ck)*pgrad;   
    end
    L=ck;
end


