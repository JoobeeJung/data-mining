format IMP_FICO BEST12.0;
label IMP_FICO = 'Imputed FICO';
length IMP_FICO 8;
IMP_FICO = FICO;
if missing(FICO) then IMP_FICO = 694.69766859;
