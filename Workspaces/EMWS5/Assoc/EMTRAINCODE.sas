*------------------------------------------------------------*;
* Assoc: 분석용 데이터 정렬;
*------------------------------------------------------------*;
proc sort data=EMWS5.TextFilter2_TRANSACTION(keep= _item_ _DOCUMENT_) out=WORK.SORTEDTRAIN;
by _DOCUMENT_;
run;
*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    _item_(DESC)
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
_item_
;
run;
quit;
options nocleanup;
proc assoc dmdb dmdbcat=WORK.EM_DMDB out=EMWS5.Assoc_ASSOC data=WORK.EM_DMDB
pctsup = 5
items=4
;
customer
_DOCUMENT_
;
target
_ITEM_
;
run;
quit;
proc rulegen in = EMWS5.Assoc_ASSOC out=EMWS5.Assoc_RULE minconf = 10
;
run;
quit;
*------------------------------------------------------------*;
* Assoc: 규칙 선택;
*------------------------------------------------------------*;
proc sort data=EMWS5.Assoc_RULE;
by descending LIFT;
where SET_SIZE>1;
run;
data WORK.ASSOCSUBSET;
set EMWS5.Assoc_RULE(obs=200);
index=_N_;
label index = "%sysfunc(sasmsg(sashelp.dmine, rpt_ruleIndex_vlabel,  NOQUOTE))";
label _LHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_leftHandSide_vlabel,  NOQUOTE))";
label _RHAND = "%sysfunc(sasmsg(sashelp.dmine, rpt_rightHandSide_vlabel,  NOQUOTE))";
run;
