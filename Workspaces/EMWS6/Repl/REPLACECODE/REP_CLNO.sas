* ;
*Variable: CLNO;
* ;
Label REP_CLNO= 'Replacement: CLNO';
length REP_CLNO 8;
REP_CLNO= CLNO;
if CLNO eq . then REP_CLNO = .;
else
if CLNO<-9.46221842 then REP_CLNO=-9.46221842;
else
if CLNO>52.110759203 then REP_CLNO=52.110759203;
