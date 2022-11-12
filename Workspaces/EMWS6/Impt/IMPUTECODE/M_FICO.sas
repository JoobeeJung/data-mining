label M_FICO = "Imputation Indicator for FICO";
if missing(FICO) then M_FICO = 1;
else M_FICO= 0;
