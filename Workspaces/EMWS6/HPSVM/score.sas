data sasep.out;
   dcl package score sc();
   dcl double "IMP_REP_CLAGE" having label n'Imputed: Replacement: CLAGE';
   dcl double "IMP_REP_CLNO" having label n'Imputed: Replacement: CLNO';
   dcl double "IMP_REP_DEBTINC" having label n'Imputed: Replacement: DEBTINC';
   dcl double "IMP_REP_DELINQ" having label n'Imputed: Replacement: DELINQ';
   dcl double "IMP_REP_DEROG" having label n'Imputed: Replacement: DEROG';
   dcl double "IMP_REP_MORTDUE" having label n'Imputed: Replacement: MORTDUE';
   dcl double "IMP_REP_NINQ" having label n'Imputed: Replacement: NINQ';
   dcl double "IMP_REP_VALUE" having label n'Imputed: Replacement: VALUE';
   dcl double "IMP_REP_YOJ" having label n'Imputed: Replacement: YOJ';
   dcl double "REP_LOAN" having label n'Replacement: LOAN';
   dcl double "_PartInd_";
   dcl nchar(7) "IMP_REASON" having label n'Imputed REASON';
   dcl nchar(7) "IMP_JOB" having label n'Imputed JOB';
   dcl double "_P_";
   dcl double "P_BAD1" having label n'Predicted: BAD=1';
   dcl double "P_BAD0" having label n'Predicted: BAD=0';
   dcl nchar(32) "I_BAD" having label n'Into: BAD';
   dcl nchar(4) "_WARN_" having label n'°æ°í';
   keep "_P_" "P_BAD1" "P_BAD0" "I_BAD" "_WARN_";
    
   varlist allvars [_all_];
    
   method init();
      sc.setvars(allvars);
      sc.setKey(n'93C7CC935C9CC9A205713ADA71F094E145F4FDB6');
   end;
    
   method run();
      set sasep.in;
      sc.scoreRecord();
   end;
enddata;
