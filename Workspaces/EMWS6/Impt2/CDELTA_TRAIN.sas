if NAME = "JOB" then delete;
else 
if NAME    = "IMP_JOB"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "REASON" then delete;
else 
if NAME    = "IMP_REASON"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
if NAME = "REP_CLAGE" then delete;
else 
if NAME    = "IMP_REP_CLAGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_CLNO" then delete;
else 
if NAME    = "IMP_REP_CLNO"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_DEBTINC" then delete;
else 
if NAME    = "IMP_REP_DEBTINC"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_DELINQ" then delete;
else 
if NAME    = "IMP_REP_DELINQ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_DEROG" then delete;
else 
if NAME    = "IMP_REP_DEROG"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_MORTDUE" then delete;
else 
if NAME    = "IMP_REP_MORTDUE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_NINQ" then delete;
else 
if NAME    = "IMP_REP_NINQ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_VALUE" then delete;
else 
if NAME    = "IMP_REP_VALUE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_YOJ" then delete;
else 
if NAME    = "IMP_REP_YOJ"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
