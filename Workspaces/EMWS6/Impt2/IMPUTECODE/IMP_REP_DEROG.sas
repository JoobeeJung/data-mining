label IMP_REP_DEROG = 'Imputed: Replacement: DEROG';
length IMP_REP_DEROG 8;
IMP_REP_DEROG = REP_DEROG;
if missing(REP_DEROG) then IMP_REP_DEROG = 0.2116898639;
