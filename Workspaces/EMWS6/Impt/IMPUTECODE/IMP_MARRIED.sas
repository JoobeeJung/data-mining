length IMP_MARRIED 8;
format IMP_MARRIED BEST12.0;
label IMP_MARRIED = 'Imputed MARRIED';
IMP_MARRIED = MARRIED;
if missing(MARRIED) then IMP_MARRIED = 1;
