* ;
*Variable: CLAGE;
* ;
Label REP_CLAGE= 'Replacement: CLAGE';
length REP_CLAGE 8;
REP_CLAGE= CLAGE;
if CLAGE eq . then REP_CLAGE = .;
else
if CLAGE<-5.558879874 then REP_CLAGE=-5.558879874;
else
if CLAGE>347.33581333 then REP_CLAGE=347.33581333;
