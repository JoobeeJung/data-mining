* ;
*Variable: VALUE;
* ;
Label REP_VALUE= 'Replacement: VALUE';
length REP_VALUE 8;
REP_VALUE= VALUE;
if VALUE eq . then REP_VALUE = .;
else
if VALUE<-71528.22897 then REP_VALUE=-71528.22897;
else
if VALUE>276305.26513 then REP_VALUE=276305.26513;
