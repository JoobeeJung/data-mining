*------------------------------------------------------------*;
* Clus: �м�;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;

%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    FASHION LEISURE ORIGINAL STRETCH
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS4.Ids_DATA
dmdbcat=WORK.Clus_DMDB
maxlevel = 513
out=WORK.Clus_DMDB
;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus: Interval �Է� Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    FASHION LEISURE ORIGINAL STRETCH
%mend DMVQINTERVAL;
*------------------------------------------------------------*;
* Clus: DMVQ ���ν��� ����;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus_DMDB dmdbcat=WORK.Clus_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="���׸�Ʈ ID" DISTLABEL="�Ÿ�";
MAKE outvar=EMWS4.Clus_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS4.Clus_OUTSTAT outmean=EMWS4.Clus_OUTMEAN;
code file="C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS4\Clus\DMVQSCORECODE.sas"
group=Clus
;
run;
quit;
*------------------------------------------------------------* ;
* Clus: DMVQ ����;
*------------------------------------------------------------* ;
%macro dmvqvars;
    FASHION LEISURE ORIGINAL STRETCH
%mend ;
