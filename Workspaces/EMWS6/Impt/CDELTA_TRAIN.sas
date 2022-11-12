if NAME = "AGE" then delete;
else 
if NAME    = "IMP_AGE"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "FICO" then delete;
else 
if NAME    = "IMP_FICO"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "INCOME" then delete;
else 
if NAME    = "IMP_INCOME"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "MARRIED" then delete;
else 
if NAME    = "IMP_MARRIED"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
if NAME = "ORGSRC" then delete;
else 
if NAME    = "IMP_ORGSRC"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "OWNHOME" then delete;
else 
if NAME    = "IMP_OWNHOME"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
if NAME = "SEX" then delete;
else 
if NAME    = "IMP_SEX"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
