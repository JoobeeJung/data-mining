label M_REP_VALUE = "Imputation Indicator for REP_VALUE";
if missing(REP_VALUE) then M_REP_VALUE = 1;
else M_REP_VALUE= 0;
