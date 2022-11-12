*------------------------------------------------------------*;
* Assoc3: �м��� ������ ����;
*------------------------------------------------------------*;
proc sort data=EMWS5.Ids9_DATA(keep= Term _DOCUMENT_) out=WORK.SORTEDTRAIN;
by _DOCUMENT_;
run;
*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Term(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;

%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.SORTEDTRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 100001
normlen= 256
out=WORK.EM_DMDB
;
id
_DOCUMENT_
;
class %DMDBClass;
target
Term
;
run;
quit;
options nocleanup;
proc assoc dmdb dmdbcat=WORK.EM_DMDB out=EMWS5.Assoc3_ASSOC data=WORK.EM_DMDB
pctsup = 1
items=2
;
customer
_DOCUMENT_
;
target
TERM
;
run;
quit;
proc rulegen in = EMWS5.Assoc3_ASSOC out=EMWS5.Assoc3_RULE minconf = 1
;
run;
quit;
*------------------------------------------------------------*;
* Assoc3: ��Ģ ����;
*------------------------------------------------------------*;
proc sort data=EMWS5.Assoc3_RULE;
by descending LIFT;
where SET_SIZE>1;
run;
data WORK.ASSOCSUBSET;
set EMWS5.Assoc3_RULE(obs=10000);
index=_N_;
label index = "%sysfunc(sasmsg(sashelp.dmine, rpt_ruleIndex_vlabel,  NOQUOTE))";
label _LHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_leftHandSide_vlabel,  NOQUOTE))";
label _RHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_rightHandSide_vlabel,  NOQUOTE))";
run;
