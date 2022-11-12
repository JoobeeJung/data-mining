*------------------------------------------------------------*;
* Neural2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.BAD;
  length   BAD                              $  32
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
BAD="1"; COUNT=1189; DATAPRIOR=0.1994966443; TRAINPRIOR=0.1994966443; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
BAD="0"; COUNT=4771; DATAPRIOR=0.8005033557; TRAINPRIOR=0.8005033557; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify BAD(type=PROFIT label=BAD);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural2;
set EMWS6.Impt2_TRAIN(keep=
BAD IMP_JOB IMP_REASON IMP_REP_CLAGE IMP_REP_CLNO IMP_REP_DEBTINC
IMP_REP_DELINQ IMP_REP_DEROG IMP_REP_MORTDUE IMP_REP_NINQ IMP_REP_VALUE
IMP_REP_YOJ REP_LOAN );
run;
*------------------------------------------------------------* ;
* Neural2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    BAD(DESC) IMP_JOB(ASC) IMP_REASON(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    IMP_REP_CLAGE IMP_REP_CLNO IMP_REP_DEBTINC IMP_REP_DELINQ IMP_REP_DEROG
   IMP_REP_MORTDUE IMP_REP_NINQ IMP_REP_VALUE IMP_REP_YOJ REP_LOAN
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural2
dmdbcat=WORK.Neural2_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
BAD
;
run;
quit;
*------------------------------------------------------------* ;
* Neural2: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    IMP_REP_CLAGE IMP_REP_CLNO IMP_REP_DEBTINC IMP_REP_DELINQ IMP_REP_DEROG
   IMP_REP_MORTDUE IMP_REP_NINQ IMP_REP_VALUE IMP_REP_YOJ REP_LOAN
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural2: Binary 입력 Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    IMP_REASON
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural2: Nominal 입력 Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    IMP_JOB
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural2: Ordinal 입력 Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* 신경망 분석;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural2 dmdbcat=WORK.Neural2_DMDB
validdata = EMWS6.Impt2_VALIDATE
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
target BAD / level=NOMINAL id=BAD
bias
;
arch MLP
Hidden=3
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS6.Neural2_PRELIM_OUTEST
;
save network=EMWS6.Neural2_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS6.Neural2_outest estiter=1
Outfit=EMWS6.Neural2_OUTFIT
;
run;
quit;
proc sort data=EMWS6.Neural2_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural2;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural2(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS6.Neural2_INITIAL;
set EMWS6.Neural2_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* 신경망 모델 선택;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural2 dmdbcat=WORK.Neural2_DMDB
validdata = EMWS6.Impt2_VALIDATE
network = EMWS6.Neural2_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS6.Neural2_INITIAL;
train tech=NONE;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Neural2\SCORECODE.sas"
group=Neural2
;
;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Neural2\RESIDUALSCORECODE.sas"
group=Neural2
residual
;
;
score data=EMWS6.Impt2_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS6.Neural2_OUTKEY;
score data=EMWS6.Impt2_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS6.Neural2_OUTKEY;
run;
quit;
data EMWS6.Neural2_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS6.Neural2_EMESTIMATE;
set EMWS6.Neural2_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural2;
run;
quit;
