*------------------------------------------------------------*;
* Smpl: Retrieving stratification variable(s) levels;
*------------------------------------------------------------*;
proc freq data=EMWS6.Ids4_DATA noprint;
;
table
BAD
/out=EMWS6.Smpl_STRATASUMMARY (rename=(count=_npop_ percent=_pctpop_)) missing;
run;
quit;
proc sort data=EMWS6.Smpl_STRATASUMMARY out=EMWS6.Smpl_STRATASUMMARY;
by descending _npop_;
run;
*------------------------------------------------------------*;
* Smpl: Create stratified sample;
*------------------------------------------------------------*;
data EMWS6.Smpl_DATA(label="Sample of EMWS6.Ids4_DATA.");
set EMWS6.Ids4_DATA;
retain _seed_ 12345;
label _dataobs_ = "%sysfunc(sasmsg(sashelp.dmine, sample_dataobs_vlabel, NOQUOTE))";
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
drop
_n000001 _s000001
_n000002 _s000002
;
if
BAD = 0
then do;
_n000001 + 1;
if _s000001 < 1000 then do;
if _genvalue_*(4771 - _n000001) <=(1000 - _s000001) then do;
_s000001 + 1;
_dataobs_=_N_;
output;
end;
end;
end;
else if
BAD = 1
then do;
_n000002 + 1;
if _s000002 < 1000 then do;
if _genvalue_*(1189 - _n000002) <=(1000 - _s000002) then do;
_s000002 + 1;
_dataobs_=_N_;
output;
end;
end;
end;
run;
