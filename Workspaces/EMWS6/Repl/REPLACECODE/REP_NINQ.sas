* ;
*Variable: NINQ;
* ;
Label REP_NINQ= 'Replacement: NINQ';
length REP_NINQ 8;
REP_NINQ= NINQ;
if NINQ eq . then REP_NINQ = .;
else
if NINQ<-4.016729639 then REP_NINQ=-4.016729639;
else
if NINQ>6.391038668 then REP_NINQ=6.391038668;
