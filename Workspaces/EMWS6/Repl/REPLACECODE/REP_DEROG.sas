* ;
*Variable: DEROG;
* ;
Label REP_DEROG= 'Replacement: DEROG';
length REP_DEROG 8;
REP_DEROG= DEROG;
if DEROG eq . then REP_DEROG = .;
else
if DEROG<-2.234030943 then REP_DEROG=-2.234030943;
else
if DEROG>2.7357977278 then REP_DEROG=2.7357977278;
