*------------------------------------------------------------*;
* Assoc2: 분석용 데이터 정렬;
*------------------------------------------------------------*;
proc sort data=EMWS5.Ids5_DATA(keep= Term _DOCUMENT_) out=WORK.SORTEDTRAIN;
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
proc assoc dmdb dmdbcat=WORK.EM_DMDB out=EMWS5.Assoc2_ASSOC data=WORK.EM_DMDB
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
proc rulegen in = EMWS5.Assoc2_ASSOC out=EMWS5.Assoc2_RULE minconf = 1
;
run;
quit;
*------------------------------------------------------------*;
* Assoc2: 규칙 선택;
*------------------------------------------------------------*;
proc sort data=EMWS5.Assoc2_RULE;
by descending LIFT;
where SET_SIZE>1;
run;
data WORK.ASSOCSUBSET;
set EMWS5.Assoc2_RULE(obs=10000);
index=_N_;
label index = "%sysfunc(sasmsg(sashelp.dmine, rpt_ruleIndex_vlabel,  NOQUOTE))";
label _LHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_leftHandSide_vlabel,  NOQUOTE))";
label _RHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_rightHandSide_vlabel,  NOQUOTE))";
run;
