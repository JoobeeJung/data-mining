length IMP_SEX $1;
format IMP_SEX $CHAR1.;
label IMP_SEX = 'Imputed SEX';
IMP_SEX = SEX;
if SEX = '' then IMP_SEX = 'M';
