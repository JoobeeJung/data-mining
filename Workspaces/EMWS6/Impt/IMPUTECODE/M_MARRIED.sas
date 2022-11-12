label M_MARRIED = "Imputation Indicator for MARRIED";
if missing(MARRIED) then M_MARRIED = 1;
else M_MARRIED= 0;
