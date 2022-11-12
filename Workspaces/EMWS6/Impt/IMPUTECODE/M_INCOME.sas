label M_INCOME = "Imputation Indicator for INCOME";
if missing(INCOME) then M_INCOME = 1;
else M_INCOME= 0;
