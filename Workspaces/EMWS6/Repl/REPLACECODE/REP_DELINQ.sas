* ;
*Variable: DELINQ;
* ;
Label REP_DELINQ= 'Replacement: DELINQ';
length REP_DELINQ 8;
REP_DELINQ= DELINQ;
if DELINQ eq . then REP_DELINQ = .;
else
if DELINQ<-3.077582316 then REP_DELINQ=-3.077582316;
else
if DELINQ>4.0155977459 then REP_DELINQ=4.0155977459;