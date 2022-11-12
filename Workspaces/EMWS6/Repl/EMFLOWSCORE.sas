* ;
* Variable: CLAGE ;
* ;
Label REP_CLAGE='Replacement: CLAGE';
Length REP_CLAGE 8;
REP_CLAGE =CLAGE ;
if CLAGE  eq . then REP_CLAGE = . ;
else
if CLAGE <-5.558879874  then REP_CLAGE  = -5.558879874 ;
else
if CLAGE >347.33581333  then REP_CLAGE  = 347.33581333 ;
* ;
* Variable: CLNO ;
* ;
Label REP_CLNO='Replacement: CLNO';
Length REP_CLNO 8;
REP_CLNO =CLNO ;
if CLNO  eq . then REP_CLNO = . ;
else
if CLNO <-9.46221842  then REP_CLNO  = -9.46221842 ;
else
if CLNO >52.110759203  then REP_CLNO  = 52.110759203 ;
* ;
* Variable: DEBTINC ;
* ;
Label REP_DEBTINC='Replacement: DEBTINC';
Length REP_DEBTINC 8;
REP_DEBTINC =DEBTINC ;
if DEBTINC  eq . then REP_DEBTINC = . ;
else
if DEBTINC <7.2115575199  then REP_DEBTINC  = 7.2115575199 ;
else
if DEBTINC >60.389780717  then REP_DEBTINC  = 60.389780717 ;
* ;
* Variable: DELINQ ;
* ;
Label REP_DELINQ='Replacement: DELINQ';
Length REP_DELINQ 8;
REP_DELINQ =DELINQ ;
if DELINQ  eq . then REP_DELINQ = . ;
else
if DELINQ <-3.077582316  then REP_DELINQ  = -3.077582316 ;
else
if DELINQ >4.0155977459  then REP_DELINQ  = 4.0155977459 ;
* ;
* Variable: DEROG ;
* ;
Label REP_DEROG='Replacement: DEROG';
Length REP_DEROG 8;
REP_DEROG =DEROG ;
if DEROG  eq . then REP_DEROG = . ;
else
if DEROG <-2.234030943  then REP_DEROG  = -2.234030943 ;
else
if DEROG >2.7357977278  then REP_DEROG  = 2.7357977278 ;
* ;
* Variable: LOAN ;
* ;
Label REP_LOAN='Replacement: LOAN';
Length REP_LOAN 8;
REP_LOAN =LOAN ;
if LOAN  eq . then REP_LOAN = . ;
else
if LOAN <-15417.34721  then REP_LOAN  = -15417.34721 ;
else
if LOAN >52848.042656  then REP_LOAN  = 52848.042656 ;
* ;
* Variable: MORTDUE ;
* ;
Label REP_MORTDUE='Replacement: MORTDUE';
Length REP_MORTDUE 8;
REP_MORTDUE =MORTDUE ;
if MORTDUE  eq . then REP_MORTDUE = . ;
else
if MORTDUE <-57533.85598  then REP_MORTDUE  = -57533.85598 ;
else
if MORTDUE >205763.33706  then REP_MORTDUE  = 205763.33706 ;
* ;
* Variable: NINQ ;
* ;
Label REP_NINQ='Replacement: NINQ';
Length REP_NINQ 8;
REP_NINQ =NINQ ;
if NINQ  eq . then REP_NINQ = . ;
else
if NINQ <-4.016729639  then REP_NINQ  = -4.016729639 ;
else
if NINQ >6.391038668  then REP_NINQ  = 6.391038668 ;
* ;
* Variable: VALUE ;
* ;
Label REP_VALUE='Replacement: VALUE';
Length REP_VALUE 8;
REP_VALUE =VALUE ;
if VALUE  eq . then REP_VALUE = . ;
else
if VALUE <-71528.22897  then REP_VALUE  = -71528.22897 ;
else
if VALUE >276305.26513  then REP_VALUE  = 276305.26513 ;
* ;
* Variable: YOJ ;
* ;
Label REP_YOJ='Replacement: YOJ';
Length REP_YOJ 8;
REP_YOJ =YOJ ;
if YOJ  eq . then REP_YOJ = . ;
else
if YOJ <-14.03331528  then REP_YOJ  = -14.03331528 ;
else
if YOJ >31.805181283  then REP_YOJ  = 31.805181283 ;
