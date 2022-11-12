***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
;
      label S_IMP_REP_CLAGE = 'Standard: IMP_REP_CLAGE' ;

      label S_IMP_REP_CLNO = 'Standard: IMP_REP_CLNO' ;

      label S_IMP_REP_DEBTINC = 'Standard: IMP_REP_DEBTINC' ;

      label S_IMP_REP_DELINQ = 'Standard: IMP_REP_DELINQ' ;

      label S_IMP_REP_DEROG = 'Standard: IMP_REP_DEROG' ;

      label S_IMP_REP_MORTDUE = 'Standard: IMP_REP_MORTDUE' ;

      label S_IMP_REP_NINQ = 'Standard: IMP_REP_NINQ' ;

      label S_IMP_REP_VALUE = 'Standard: IMP_REP_VALUE' ;

      label S_IMP_REP_YOJ = 'Standard: IMP_REP_YOJ' ;

      label S_REP_LOAN = 'Standard: REP_LOAN' ;

      label IMP_REASONDebtCon = 'Dummy: IMP_REASON=DebtCon' ;

      label IMP_JOBMgr = 'Dummy: IMP_JOB=Mgr' ;

      label IMP_JOBOffice = 'Dummy: IMP_JOB=Office' ;

      label IMP_JOBOther = 'Dummy: IMP_JOB=Other' ;

      label IMP_JOBProfExe = 'Dummy: IMP_JOB=ProfExe' ;

      label IMP_JOBSales = 'Dummy: IMP_JOB=Sales' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_BAD = 'Into: BAD' ;

      label U_BAD = 'Unnormalized Into: BAD' ;

      label P_BAD1 = 'Predicted: BAD=1' ;

      label P_BAD0 = 'Predicted: BAD=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for IMP_REASON ;
drop IMP_REASONDebtCon ;
if missing( IMP_REASON ) then do;
   IMP_REASONDebtCon = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm7 $ 7; drop _dm7 ;
   %DMNORMCP( IMP_REASON , _dm7 )
   if _dm7 = 'DEBTCON'  then do;
      IMP_REASONDebtCon = 1;
   end;
   else if _dm7 = 'HOMEIMP'  then do;
      IMP_REASONDebtCon = -1;
   end;
   else do;
      IMP_REASONDebtCon = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_JOB ;
drop IMP_JOBMgr IMP_JOBOffice IMP_JOBOther IMP_JOBProfExe IMP_JOBSales ;
*** encoding is sparse, initialize to zero;
IMP_JOBMgr = 0;
IMP_JOBOffice = 0;
IMP_JOBOther = 0;
IMP_JOBProfExe = 0;
IMP_JOBSales = 0;
if missing( IMP_JOB ) then do;
   IMP_JOBMgr = .;
   IMP_JOBOffice = .;
   IMP_JOBOther = .;
   IMP_JOBProfExe = .;
   IMP_JOBSales = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm7 $ 7; drop _dm7 ;
   %DMNORMCP( IMP_JOB , _dm7 )
   _dm_find = 0; drop _dm_find;
   if _dm7 <= 'OTHER'  then do;
      if _dm7 <= 'OFFICE'  then do;
         if _dm7 = 'MGR'  then do;
            IMP_JOBMgr = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm7 = 'OFFICE'  then do;
               IMP_JOBOffice = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm7 = 'OTHER'  then do;
            IMP_JOBOther = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm7 <= 'SALES'  then do;
         if _dm7 = 'PROFEXE'  then do;
            IMP_JOBProfExe = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm7 = 'SALES'  then do;
               IMP_JOBSales = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm7 = 'SELF'  then do;
            IMP_JOBMgr = -1;
            IMP_JOBOffice = -1;
            IMP_JOBOther = -1;
            IMP_JOBProfExe = -1;
            IMP_JOBSales = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      IMP_JOBMgr = .;
      IMP_JOBOffice = .;
      IMP_JOBOther = .;
      IMP_JOBProfExe = .;
      IMP_JOBSales = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   IMP_REP_CLAGE , 
   IMP_REP_CLNO , 
   IMP_REP_DEBTINC , 
   IMP_REP_DELINQ , 
   IMP_REP_DEROG , 
   IMP_REP_MORTDUE , 
   IMP_REP_NINQ , 
   IMP_REP_VALUE , 
   IMP_REP_YOJ , 
   REP_LOAN   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_IMP_REP_CLAGE  =    -2.33813063127283 +     0.01312253642173 * 
        IMP_REP_CLAGE ;
   S_IMP_REP_CLNO  =     -2.1482593187282 +     0.10095489791605 * 
        IMP_REP_CLNO ;
   S_IMP_REP_DEBTINC  =    -5.05472360479797 +     0.15014089257931 * 
        IMP_REP_DEBTINC ;
   S_IMP_REP_DELINQ  =    -0.47126652544413 +      1.1112635770511 * 
        IMP_REP_DELINQ ;
   S_IMP_REP_DEROG  =    -0.38739967635386 +     1.83003413240401 * 
        IMP_REP_DEROG ;
   S_IMP_REP_MORTDUE  =    -1.86730921564428 +     0.00002542590625 * 
        IMP_REP_MORTDUE ;
   S_IMP_REP_NINQ  =    -0.78617240685517 +     0.69251235459488 * 
        IMP_REP_NINQ ;
   S_IMP_REP_VALUE  =    -1.99608907565343 +     0.00001969243894 * 
        IMP_REP_VALUE ;
   S_IMP_REP_YOJ  =    -1.22223931537146 +     0.13782009944161 * IMP_REP_YOJ
         ;
   S_REP_LOAN  =    -1.78992497466117 +      0.0000969304683 * REP_LOAN ;
END;
ELSE DO;
   IF MISSING( IMP_REP_CLAGE ) THEN S_IMP_REP_CLAGE  = . ;
   ELSE S_IMP_REP_CLAGE  =    -2.33813063127283 +     0.01312253642173 * 
        IMP_REP_CLAGE ;
   IF MISSING( IMP_REP_CLNO ) THEN S_IMP_REP_CLNO  = . ;
   ELSE S_IMP_REP_CLNO  =     -2.1482593187282 +     0.10095489791605 * 
        IMP_REP_CLNO ;
   IF MISSING( IMP_REP_DEBTINC ) THEN S_IMP_REP_DEBTINC  = . ;
   ELSE S_IMP_REP_DEBTINC  =    -5.05472360479797 +     0.15014089257931 * 
        IMP_REP_DEBTINC ;
   IF MISSING( IMP_REP_DELINQ ) THEN S_IMP_REP_DELINQ  = . ;
   ELSE S_IMP_REP_DELINQ  =    -0.47126652544413 +      1.1112635770511 * 
        IMP_REP_DELINQ ;
   IF MISSING( IMP_REP_DEROG ) THEN S_IMP_REP_DEROG  = . ;
   ELSE S_IMP_REP_DEROG  =    -0.38739967635386 +     1.83003413240401 * 
        IMP_REP_DEROG ;
   IF MISSING( IMP_REP_MORTDUE ) THEN S_IMP_REP_MORTDUE  = . ;
   ELSE S_IMP_REP_MORTDUE  =    -1.86730921564428 +     0.00002542590625 * 
        IMP_REP_MORTDUE ;
   IF MISSING( IMP_REP_NINQ ) THEN S_IMP_REP_NINQ  = . ;
   ELSE S_IMP_REP_NINQ  =    -0.78617240685517 +     0.69251235459488 * 
        IMP_REP_NINQ ;
   IF MISSING( IMP_REP_VALUE ) THEN S_IMP_REP_VALUE  = . ;
   ELSE S_IMP_REP_VALUE  =    -1.99608907565343 +     0.00001969243894 * 
        IMP_REP_VALUE ;
   IF MISSING( IMP_REP_YOJ ) THEN S_IMP_REP_YOJ  = . ;
   ELSE S_IMP_REP_YOJ  =    -1.22223931537146 +     0.13782009944161 * 
        IMP_REP_YOJ ;
   IF MISSING( REP_LOAN ) THEN S_REP_LOAN  = . ;
   ELSE S_REP_LOAN  =    -1.78992497466117 +      0.0000969304683 * REP_LOAN ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.23495615256474 * S_IMP_REP_CLAGE  +     0.11373927927459 * 
        S_IMP_REP_CLNO  +    -0.25237007452142 * S_IMP_REP_DEBTINC
          +    -0.25697335249342 * S_IMP_REP_DELINQ  +    -0.09325862491461 * 
        S_IMP_REP_DEROG  +     0.16420974326463 * S_IMP_REP_MORTDUE
          +    -0.05913454754912 * S_IMP_REP_NINQ  +    -0.13044973139802 * 
        S_IMP_REP_VALUE  +    -0.01150754366685 * S_IMP_REP_YOJ
          +     0.24039635425948 * S_REP_LOAN ;
   H12  =    -0.25091992874295 * S_IMP_REP_CLAGE  +     0.12360212488771 * 
        S_IMP_REP_CLNO  +    -0.34461861721755 * S_IMP_REP_DEBTINC
          +     0.35421178446845 * S_IMP_REP_DELINQ  +    -0.00238163876725 * 
        S_IMP_REP_DEROG  +     0.02828648742079 * S_IMP_REP_MORTDUE
          +     0.22386518466135 * S_IMP_REP_NINQ  +     0.29486529699533 * 
        S_IMP_REP_VALUE  +    -0.07747076039086 * S_IMP_REP_YOJ
          +     0.54015749886187 * S_REP_LOAN ;
   H13  =     0.44655742966962 * S_IMP_REP_CLAGE  +     0.12493440148986 * 
        S_IMP_REP_CLNO  +    -0.11604225830324 * S_IMP_REP_DEBTINC
          +    -0.04968642258172 * S_IMP_REP_DELINQ  +     0.59999143535871 * 
        S_IMP_REP_DEROG  +    -0.26253616527628 * S_IMP_REP_MORTDUE
          +     0.44305325680994 * S_IMP_REP_NINQ  +    -0.50562379984045 * 
        S_IMP_REP_VALUE  +    -0.35847209519017 * S_IMP_REP_YOJ
          +    -0.87927961363098 * S_REP_LOAN ;
   H11  = H11  +    -0.21498823955017 * IMP_REASONDebtCon ;
   H12  = H12  +    -0.09991084247109 * IMP_REASONDebtCon ;
   H13  = H13  +    -1.41304227347692 * IMP_REASONDebtCon ;
   H11  = H11  +     0.21074589775924 * IMP_JOBMgr  +     0.26775001314436 * 
        IMP_JOBOffice  +     0.08034830103823 * IMP_JOBOther
          +     0.10115896088428 * IMP_JOBProfExe  +    -0.25965257234992 * 
        IMP_JOBSales ;
   H12  = H12  +     0.26095532485859 * IMP_JOBMgr  +    -0.01776229105211 * 
        IMP_JOBOffice  +     0.01669775653193 * IMP_JOBOther
          +     -0.1882183575943 * IMP_JOBProfExe  +     0.88600077720954 * 
        IMP_JOBSales ;
   H13  = H13  +     0.58648303742701 * IMP_JOBMgr  +    -0.39954048710671 * 
        IMP_JOBOffice  +    -0.38133681114138 * IMP_JOBOther
          +     0.48163313025255 * IMP_JOBProfExe  +     0.97053257954511 * 
        IMP_JOBSales ;
   H11  =     0.08023809498707 + H11 ;
   H12  =    -1.78702932895541 + H12 ;
   H13  =    -2.15335101000066 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node BAD ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_BAD1  =    -2.78633448628144 * H11  +     2.46438351532579 * H12
          +     1.29003762556869 * H13 ;
   P_BAD1  =       1.511393070617 + P_BAD1 ;
   P_BAD0  = 0; 
   _MAX_ = MAX (P_BAD1 , P_BAD0 );
   _SUM_ = 0.; 
   P_BAD1  = EXP(P_BAD1  - _MAX_);
   _SUM_ = _SUM_ + P_BAD1 ;
   P_BAD0  = EXP(P_BAD0  - _MAX_);
   _SUM_ = _SUM_ + P_BAD0 ;
   P_BAD1  = P_BAD1  / _SUM_;
   P_BAD0  = P_BAD0  / _SUM_;
END;
ELSE DO;
   P_BAD1  = .;
   P_BAD0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_BAD1  =     0.19928057553956;
   P_BAD0  =     0.80071942446043;
END;
*** *************************;
*** Writing the I_BAD  AND U_BAD ;
*** *************************;
_MAXP_ = P_BAD1 ;
I_BAD  = "1           " ;
U_BAD  =                    1;
IF( _MAXP_ LT P_BAD0  ) THEN DO; 
   _MAXP_ = P_BAD0 ;
   I_BAD  = "0           " ;
   U_BAD  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
