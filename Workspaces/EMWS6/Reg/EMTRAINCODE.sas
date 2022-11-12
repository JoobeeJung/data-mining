*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS6.Part_TRAIN(keep=
AGE BUY12 BUY18 BUY6 CLIMATE COA6 DISCBUY FICO INCOME LOC MARRIED ORGSRC
OWNHOME RESPOND RETURN24 SEX VALUE24 );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    CLIMATE(ASC) COA6(ASC) DISCBUY(ASC) LOC(ASC) MARRIED(ASC) ORGSRC(ASC)
   OWNHOME(ASC) RESPOND(DESC) RETURN24(ASC) SEX(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AGE BUY12 BUY18 BUY6 FICO INCOME VALUE24
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
RESPOND
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS6.Part_VALIDATE
outest = EMWS6.Reg_EMESTIMATE
outterms = EMWS6.Reg_OUTTERMS
outmap= EMWS6.Reg_MAPDS namelen=200
;
class
RESPOND
CLIMATE
COA6
DISCBUY
LOC
MARRIED
ORGSRC
OWNHOME
RETURN24
SEX
;
model RESPOND =
AGE
BUY12
BUY18
BUY6
CLIMATE
COA6
DISCBUY
FICO
INCOME
LOC
MARRIED
ORGSRC
OWNHOME
RETURN24
SEX
VALUE24
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
;
;
score data=EMWS6.Part_TEST
out=_null_
outfit=EMWS6.Reg_FITTEST
role = TEST
;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
