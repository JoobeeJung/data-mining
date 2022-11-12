filename temp catalog "sashelp.emtxtext.tmt_doc_score.source";
%include temp;
filename temp catalog "sashelp.emtxtext.row_pivot_normalize.source";
%include temp;
filename temp;
 
libname termloc "C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS5";
 
%let _multifile=%SYSFUNC(PATHNAME(work))/TextFilter7_multi.txt;
%let _multiSLength= %klength(&_multifile);
 
data termloc.TextFilter7_tmconfig;
length multiterm $ &_multiSLength;
set termloc.TextFilter7_tmconfig;
multiterm=ktrim(symget('_multifile'));
run;
 
proc sql noprint;
select multiencoding into: _tmmultiencoding
from termloc.TextFilter7_tmconfig;
quit;
 
filename _multout "&_multifile";
data _NULL_;
set termloc.TextParsing7_multiall;
file _multout encoding= "%trim(&_tmmultiencoding)";
put term ':3:' role;
run;
