*------------------------------------------------------------*;
* Neural: Create decision matrix;
*------------------------------------------------------------*;
data WORK.RESPOND;
  length   RESPOND                          $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
RESPOND="1"; COUNT=767; DATAPRIOR=0.0767; TRAINPRIOR=0.0767; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
RESPOND="0"; COUNT=9233; DATAPRIOR=0.9233; TRAINPRIOR=0.9233; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify RESPOND(type=PROFIT label=RESPOND);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural;
set EMWS6.Part_TRAIN(keep=
AGE BUY12 BUY18 BUY6 CLIMATE COA6 DISCBUY FICO INCOME LOC MARRIED ORGSRC
OWNHOME RESPOND RETURN24 SEX VALUE24 );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    CLIMATE(ASC) COA6(ASC) DISCBUY(ASC) LOC(ASC) MARRIED(ASC) ORGSRC(ASC)
   OWNHOME(ASC) RESPOND(DESC) RETURN24(ASC) SEX(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AGE BUY12 BUY18 BUY6 FICO INCOME VALUE24
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
RESPOND
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AGE BUY12 BUY18 BUY6 FICO INCOME VALUE24
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Binary 입력 Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    COA6 DISCBUY MARRIED OWNHOME RETURN24 SEX
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Nominal 입력 Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    CLIMATE LOC ORGSRC
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Ordinal 입력 Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* 신경망 분석;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS6.Part_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %BININPUTS / level=nominal id=bin
;
input %NOMINPUTS / level=nominal id=nom
;
target RESPOND / level=NOMINAL id=RESPOND
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS6.Neural_PRELIM_OUTEST
;
save network=EMWS6.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS6.Neural_outest estiter=1
Outfit=EMWS6.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS6.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS6.Neural_INITIAL;
set EMWS6.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* 신경망 모델 선택;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS6.Part_VALIDATE
network = EMWS6.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS6.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS6.Part_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS6.Neural_OUTKEY;
score data=EMWS6.Part_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS6.Neural_OUTKEY;
score data=EMWS6.Part_TEST out=_NULL_
outfit=WORK.FIT3
role=TEST
outkey=EMWS6.Neural_OUTKEY;
run;
quit;
data EMWS6.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2 WORK.FIT3;
run;
data EMWS6.Neural_EMESTIMATE;
set EMWS6.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
