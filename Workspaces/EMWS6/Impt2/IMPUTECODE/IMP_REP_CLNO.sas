label IMP_REP_CLNO = 'Imputed: Replacement: CLNO';
length IMP_REP_CLNO 8;
IMP_REP_CLNO = REP_CLNO;
if missing(REP_CLNO) then IMP_REP_CLNO = 21.279396672;
