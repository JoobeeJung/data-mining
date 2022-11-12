
libname termloc "C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS5";

%let _multifile=%SYSFUNC(PATHNAME(work))/TextFilter3_multi.txt;
%let _multiSLength= %klength(&_multifile);

data termloc.TextFilter3_tmconfig;
length multiterm $ &_multiSLength;
set termloc.TextFilter3_tmconfig;
multiterm=ktrim(symget('_multifile'));
run;

proc sql noprint;
select multiencoding into: _tmmultiencoding
from termloc.TextFilter3_tmconfig;
quit;

filename _multout "&_multifile";
data _NULL_;
set termloc.TextParsing3_multiall;
file _multout encoding= "%trim(&_tmmultiencoding)";
put term ':3:' role;
run;
