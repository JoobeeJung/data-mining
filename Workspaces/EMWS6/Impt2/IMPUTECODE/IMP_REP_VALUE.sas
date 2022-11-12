label IMP_REP_VALUE = 'Imputed: Replacement: VALUE';
length IMP_REP_VALUE 8;
IMP_REP_VALUE = REP_VALUE;
if missing(REP_VALUE) then IMP_REP_VALUE = 101363.22276;
