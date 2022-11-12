length IMP_ORGSRC $1;
format IMP_ORGSRC $CHAR1.;
label IMP_ORGSRC = 'Imputed ORGSRC';
IMP_ORGSRC = ORGSRC;
if ORGSRC = '' then IMP_ORGSRC = 'O';
