%% Read data set function
function [ngmar,num]=readfile(i)
   if(i==1) 
   E=load('.\Data\breastmnist_224.mat');
   A1=E.train_images;
   A2=E.test_images;
   A3=E.val_images;
   ngmar= double(cat(1,A1,A2,A3));
   num=length(size(ngmar));
   elseif(i==2) 
   E=load('.\Data\PosteriorEmssion.mat');
   ngmar= E.tensor_nc_var;
   num=length(size(ngmar));


     elseif(i==3)
        E=load('.\Data\PNW-ML.mat');
   ngmar= double(E.fea);
%    ngmar=ngmar(2501:14500,:,:);

   label= double(E.gnd);
   sizea=100;
   ngmar=reshape(ngmar,sizea,size(ngmar,1)/sizea,3,size(ngmar,3));
   ngmar1=ngmar;


       M1=tenmat(ngmar,length(size(ngmar)));
    M11=double(M1)';
%     M11 = wdenoise(M11);
    M11=normalize(M11,'range');
    
    M11=M11';
    rdims =M1.rdims;% Dimensions that were mapped to the rows.
    cdims =M1.cdims;% Dimensions that were mapped to the columns.
    tsize = size(ngmar); %或M1.tsize % Size of the original tensor.
    M10=tenmat(M11,rdims,cdims,tsize);
    ngmar=tensor(M10);

%     tlabel=double(label);
%     R=length(unique(tlabel));
%     if(find(tlabel==0)~=0)
%        tlabel=tlabel(:,1)+1;
%     end
       

%     len=10;
%     labelu=unique(tlabel);
%    
%     label=[];
%     id=[];
%      for j=1:R
%          temp=find(tlabel==labelu(j));
%          id=[id;temp(1:len)];
%          label=[label,ones(1,len)*j];
%      end
%     
%      tlabel=tlabel(id);
%      ngmart=ngmar(:,:,:,id);
%      ngmar1=ngmar1(:,:,:,id);
%      ngmar=ngmart;
     num=length(size(ngmar));

% 
% ll=ngmar(:,1,1,1);
% l1=ngmar1(:,1,1);
% norm(ll-l1(1:100));


  end 

end