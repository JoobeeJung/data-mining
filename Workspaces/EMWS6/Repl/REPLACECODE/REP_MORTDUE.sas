* ;
*Variable: MORTDUE;
* ;
Label REP_MORTDUE= 'Replacement: MORTDUE';
length REP_MORTDUE 8;
REP_MORTDUE= MORTDUE;
if MORTDUE eq . then REP_MORTDUE = .;
else
if MORTDUE<-57533.85598 then REP_MORTDUE=-57533.85598;
else
if MORTDUE>205763.33706 then REP_MORTDUE=205763.33706;
