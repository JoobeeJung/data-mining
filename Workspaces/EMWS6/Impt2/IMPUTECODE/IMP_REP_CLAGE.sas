label IMP_REP_CLAGE = 'Imputed: Replacement: CLAGE';
length IMP_REP_CLAGE 8;
IMP_REP_CLAGE = REP_CLAGE;
if missing(REP_CLAGE) then IMP_REP_CLAGE = 178.17673018;
