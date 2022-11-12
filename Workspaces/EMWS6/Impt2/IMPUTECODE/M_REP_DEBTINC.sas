label M_REP_DEBTINC = "Imputation Indicator for REP_DEBTINC";
if missing(REP_DEBTINC) then M_REP_DEBTINC = 1;
else M_REP_DEBTINC= 0;
