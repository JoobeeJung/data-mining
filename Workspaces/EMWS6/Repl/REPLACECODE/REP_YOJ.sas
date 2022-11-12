* ;
*Variable: YOJ;
* ;
Label REP_YOJ= 'Replacement: YOJ';
length REP_YOJ 8;
REP_YOJ= YOJ;
if YOJ eq . then REP_YOJ = .;
else
if YOJ<-14.03331528 then REP_YOJ=-14.03331528;
else
if YOJ>31.805181283 then REP_YOJ=31.805181283;
