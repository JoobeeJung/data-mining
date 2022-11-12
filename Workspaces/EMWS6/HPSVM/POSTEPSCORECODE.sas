*------------------------------------------------------------*;
*Computing Classification Vars: BAD;
*------------------------------------------------------------*;
length _format200 $200;
drop _format200;
_format200= ' ' ;
length _p_ 8;
_p_= 0 ;
drop _p_ ;
if P_BAD1 - _p_ > 1e-8 then do ;
   _p_= P_BAD1 ;
   _format200='1';
end;
if P_BAD0 - _p_ > 1e-8 then do ;
   _p_= P_BAD0 ;
   _format200='0';
end;
I_BAD=dmnorm(_format200,32); ;
length U_BAD 8;
label U_BAD = 'Unnormalized Into: BAD';
if I_BAD='1' then
U_BAD=1;
if I_BAD='0' then
U_BAD=0;
