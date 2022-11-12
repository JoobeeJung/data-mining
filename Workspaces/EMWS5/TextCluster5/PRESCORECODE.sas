filename temp catalog "sashelp.emtext.tmemclus.source";
%include temp;
filename temp catalog "sashelp.emtext.tmpred.source";
%include temp;
filename temp catalog "sashelp.emtxtext.tmc_doc_score.source";
%include temp;
filename temp catalog "sashelp.emtext.tmsort.source";
%include temp;
filename temp catalog "sashelp.emtext.tmsvd.source";
%include temp;
filename temp catalog "sashelp.emtext.tmfast.source";
%include temp;
filename temp;
 
libname termloc "C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS5";
 
%let _multifile=%SYSFUNC(PATHNAME(work))/TextFilter5_multi.txt;
%let _multiSLength= %klength(&_multifile);
 
data termloc.TextFilter5_tmconfig;
length multiterm $ &_multiSLength;
set termloc.TextFilter5_tmconfig;
multiterm=ktrim(symget('_multifile'));
run;
 
proc sql noprint;
select multiencoding into: _tmmultiencoding
from termloc.TextFilter5_tmconfig;
quit;
 
filename _multout "&_multifile";
data _NULL_;
set termloc.TextParsing5_multiall;
file _multout encoding= "%trim(&_tmmultiencoding)";
put term ':3:' role;
run;
