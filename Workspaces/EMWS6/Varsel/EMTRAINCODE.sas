*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    CLIMATE(ASC) COA6(ASC) DISCBUY(ASC) LOC(ASC) MARRIED(ASC) ORGSRC(ASC)
   OWNHOME(ASC) RESPOND(DESC) RETURN24(ASC) SEX(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AGE BUY12 BUY18 BUY6 FICO INCOME VALUE24
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\ADMINI~1\AppData\Local\Temp\SAS Temporary Files\_TD8092_DESKTOP-IOK0OJ9_\Prc2";
proc dmdb batch data=EMWS6.Part2_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
RESPOND
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               AGE BUY12 BUY18 BUY6 CLIMATE COA6 DISCBUY FICO INCOME LOC MARRIED ORGSRC
   OWNHOME RETURN24 SEX VALUE24
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS6.Varsel_OUTGROUP outest=EMWS6.Varsel_OUTESTDMINE outeffect=EMWS6.Varsel_OUTEFFECT outrsquare =EMWS6.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target RESPOND;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS6.Varsel_OUTEFFECT;      proc print data =EMWS6.Varsel_OUTRSQUARE;      */
run;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               AGE BUY12 BUY18 BUY6 CLIMATE COA6 DISCBUY FICO INCOME LOC MARRIED ORGSRC
   OWNHOME RETURN24 SEX VALUE24
%mend INPUTS;
proc dmsplit data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
bins=50 chisq=3.84 passes=6 outvars=WORK._Varsel_OUTESTDMSPLIT
PSHORT
;
;
var %INPUTS;
target RESPOND;
run;
proc split dmdbcat=WORK.EM_DMDB indmsplit subtree=largest outtree=EMWS6.Varsel_TREE
outnodes =EMWS6.Varsel_OUTNODES outleaf = EMWS6.Varsel_OUTLEAF outimportance = EMWS6.Varsel_OUTIMPORTNC
;
run;
