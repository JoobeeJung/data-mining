*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    FASHION LEISURE ORIGINAL STRETCH
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS4.Ids_DATA
dmdbcat=WORK.EM_DMDB
maxlevel = 513
;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* PRINCOMP: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    FASHION LEISURE ORIGINAL STRETCH
%mend INPUTS;
proc dmneurl data=EMWS4.Ids_DATA dmdbcat=WORK.EM_DMDB
outstat=EMWS4.PRINCOMP_OUTSTAT outclass=EMWS4.PRINCOMP_OUTCLASS
CORR
NOMONITOR
;
var %INPUTS;
;
run;
