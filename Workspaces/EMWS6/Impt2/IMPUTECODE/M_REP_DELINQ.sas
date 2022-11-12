label M_REP_DELINQ = "Imputation Indicator for REP_DELINQ";
if missing(REP_DELINQ) then M_REP_DELINQ = 1;
else M_REP_DELINQ= 0;
