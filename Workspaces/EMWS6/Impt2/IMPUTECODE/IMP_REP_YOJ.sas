label IMP_REP_YOJ = 'Imputed: Replacement: YOJ';
length IMP_REP_YOJ 8;
IMP_REP_YOJ = REP_YOJ;
if missing(REP_YOJ) then IMP_REP_YOJ = 8.8683676788;
