*************************************************************;
*******       Begin Scoring Code from PROC HPSVM      *******;
*************************************************************;
length _WARN_ $4;
label _WARN_ = 'Warnings';
 
length _P_ 8;
length _PVAL 8;
_PVAL=0.0;
length _missingflag_ 8;
drop _missingflag_;
_missingflag_ = 0;
length _unknownflag_ 8;
drop _unknownflag_;
_unknownflag_ = 0;
length _unknown_ 8;
drop _unknown_;
_unknown_ = 0;
 
_missingflag_ = NMISS(
    IMP_REP_CLAGE,
    IMP_REP_CLNO,
    IMP_REP_DEBTINC,
    IMP_REP_DELINQ,
    IMP_REP_DEROG,
    IMP_REP_MORTDUE,
    IMP_REP_NINQ,
    IMP_REP_VALUE,
    IMP_REP_YOJ,
    REP_LOAN);
if _missingflag_ > 0 then
  substr(_WARN_, 1, 1) = 'M';
 
*****************    class:  IMP_REASON     ********************;
length _NORM8 $ 32;
%DMNORMCP( IMP_REASON, _NORM8 )
drop _NORM8;
select(_NORM8);
  when('DEBTCON' ) _PVAL = _PVAL +   -5.49376913062350E-04;
  when('HOMEIMP' ) _PVAL = _PVAL +    5.49376913113940E-04;
  otherwise _unknown_ = 1;
end;
if _unknown_ = 1 then do;
    if MISSING(_NORM8) or _NORM8 = '.' then do;
        _missingflag_ = 1;
    end; else do;
        _unknownflag_ = 1;
    end;
    _unknown_ = 0;
end;
 
*****************    class:  IMP_JOB     ********************;
length _NORM8 $ 32;
%DMNORMCP( IMP_JOB, _NORM8 )
drop _NORM8;
select(_NORM8);
  when('MGR' ) _PVAL = _PVAL +    6.22559945534040E-02;
  when('OFFICE' ) _PVAL = _PVAL +    1.62188904983960E-01;
  when('OTHER' ) _PVAL = _PVAL +    1.00966721268470E-01;
  when('PROFEXE' ) _PVAL = _PVAL +    1.17749358201850E-01;
  when('SALES' ) _PVAL = _PVAL +   -2.98691103218330E-01;
  when('SELF' ) _PVAL = _PVAL +   -1.44469875789320E-01;
  otherwise _unknown_ = 1;
end;
if _unknown_ = 1 then do;
    if MISSING(_NORM8) or _NORM8 = '.' then do;
        _missingflag_ = 1;
    end; else do;
        _unknownflag_ = 1;
    end;
    _unknown_ = 0;
end;
 
*****************   interval:  IMP_REP_CLAGE   ********************;
if missing( IMP_REP_CLAGE ) then do;
  _PVAL = _PVAL +    3.57860197305960E-01;
end; else do;
  _PVAL = _PVAL + IMP_REP_CLAGE *    2.01302388242550E-03;
end;
 
*****************   interval:  IMP_REP_CLNO   ********************;
if missing( IMP_REP_CLNO ) then do;
  _PVAL = _PVAL +    1.03882628059960E-01;
end; else do;
  _PVAL = _PVAL + IMP_REP_CLNO *    4.88720029429590E-03;
end;
 
*****************   interval:  IMP_REP_DEBTINC   ********************;
if missing( IMP_REP_DEBTINC ) then do;
  _PVAL = _PVAL +   -4.75447554404790E-01;
end; else do;
  _PVAL = _PVAL + (IMP_REP_DEBTINC
         -    7.21155751990000E+00) *   -1.79709176053110E-02;
end;
 
*****************   interval:  IMP_REP_DELINQ   ********************;
if missing( IMP_REP_DELINQ ) then do;
  _PVAL = _PVAL +   -2.05633041126720E-01;
end; else do;
  _PVAL = _PVAL + IMP_REP_DELINQ *   -4.98125217485140E-01;
end;
 
*****************   interval:  IMP_REP_DEROG   ********************;
if missing( IMP_REP_DEROG ) then do;
  _PVAL = _PVAL +   -6.04645268747390E-02;
end; else do;
  _PVAL = _PVAL + IMP_REP_DEROG *   -2.85886526704640E-01;
end;
 
*****************   interval:  IMP_REP_MORTDUE   ********************;
if missing( IMP_REP_MORTDUE ) then do;
  _PVAL = _PVAL +    1.99576442150990E-01;
end; else do;
  _PVAL = _PVAL + (IMP_REP_MORTDUE
         -    2.06300000000000E+03) *    2.81265049288710E-06;
end;
 
*****************   interval:  IMP_REP_NINQ   ********************;
if missing( IMP_REP_NINQ ) then do;
  _PVAL = _PVAL +   -8.69344235930520E-02;
end; else do;
  _PVAL = _PVAL + IMP_REP_NINQ *   -7.66203531134030E-02;
end;
 
*****************   interval:  IMP_REP_VALUE   ********************;
if missing( IMP_REP_VALUE ) then do;
  _PVAL = _PVAL +   -2.04566721559350E-01;
end; else do;
  _PVAL = _PVAL + (IMP_REP_VALUE
         -    8.00000000000000E+03) *   -2.20551823886690E-06;
end;
 
*****************   interval:  IMP_REP_YOJ   ********************;
if missing( IMP_REP_YOJ ) then do;
  _PVAL = _PVAL +    2.48392538979150E-02;
end; else do;
  _PVAL = _PVAL + IMP_REP_YOJ *    2.78916839317700E-03;
end;
 
*****************   interval:  REP_LOAN   ********************;
if missing( REP_LOAN ) then do;
  _PVAL = _PVAL +    1.25421480397250E-01;
end; else do;
  _PVAL = _PVAL + (REP_LOAN
         -    1.10000000000000E+03) *    7.26159845947880E-06;
end;
 
*********************   BETA   ******************;
_PVAL = _PVAL +    1.18631325985230E+00;
_P_ = _PVAL;
 
if _missingflag_ > 0 then
  substr(_WARN_, 1, 1) = 'M';
if _unknownflag_ > 0 then
  substr(_WARN_, 2, 1) = 'U';
 
*************  predictive target  ***************;
length P_BAD1 8;
label P_BAD1 = 'Predicted: BAD=1' ;
length P_BAD0 8;
label P_BAD0 = 'Predicted: BAD=0' ;
length I_BAD $ 32;
label I_BAD = 'Into: BAD' ;
 
if _PVAL ge 0.0 then _PVAL = _PVAL/   2.18338628860380E+00;
else _PVAL = -_PVAL/  -2.03276780866480E+00;
_PVAL = (_PVAL + 1) * 0.5;
if _PVAL > 1 then _PVAL = 1.0;
else if _PVAL < 0 then _PVAL = 0.0;
 
_PVAL = 1 - _PVAL;
P_BAD1 = _PVAL;
P_BAD0 = 1 - P_BAD1;
 
if _PVAL ge 0.5 then I_BAD = '1' ;
else I_BAD = '0' ;
drop _PVAL;
 
*************************************************************;
*******       End Scoring Code from PROC HPSVM        *******;
*************************************************************;
 
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
