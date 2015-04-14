function [ BV, STD ] = seg2BV( Vdemod, trim_demod,varargin )
%seg2BV gets boundary voltages from hilbert transformed results and
%calculated standard dev
%   Detailed explanation goes here

%get boundary voltages by trimming the ends off and taking mean
BVtmp=squeeze(nanmean(Vdemod(:,trim_demod:end-trim_demod,:,:),2));
STDtmp=squeeze(nanstd(Vdemod,1,2));

N_prt=size(Vdemod,1);
N_elec=size(Vdemod,3);
N_rep=size(Vdemod,4);


BV=nan(N_prt*N_elec,N_rep);
STD=nan(size(BV));


if (isempty(varargin) == 1 && N_prt > 1)%if no extra input then go ahead and reshape
    
    for iPrt =1:N_prt
        
        idx=((iPrt-1)*N_elec) +1;
        BV(idx:idx+N_elec-1,:)=squeeze(BVtmp(iPrt,:,:));
        STD(idx:idx+N_elec-1,:)=squeeze(STDtmp(iPrt,:,:));
    end
    

else
    BV=BVtmp;
    STD=STDtmp;
end



end

