* ;
*Variable: LOAN;
* ;
Label REP_LOAN= 'Replacement: LOAN';
length REP_LOAN 8;
REP_LOAN= LOAN;
if LOAN eq . then REP_LOAN = .;
else
if LOAN<-15417.34721 then REP_LOAN=-15417.34721;
else
if LOAN>52848.042656 then REP_LOAN=52848.042656;
