label IMP_REP_NINQ = 'Imputed: Replacement: NINQ';
length IMP_REP_NINQ 8;
IMP_REP_NINQ = REP_NINQ;
if missing(REP_NINQ) then IMP_REP_NINQ = 1.1352467601;
