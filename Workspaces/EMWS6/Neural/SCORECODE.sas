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
      label S_AGE = 'Standard: AGE' ;

      label S_BUY12 = 'Standard: BUY12' ;

      label S_BUY18 = 'Standard: BUY18' ;

      label S_BUY6 = 'Standard: BUY6' ;

      label S_FICO = 'Standard: FICO' ;

      label S_INCOME = 'Standard: INCOME' ;

      label S_VALUE24 = 'Standard: VALUE24' ;

      label COA60 = 'Dummy: COA6=0' ;

      label DISCBUY0 = 'Dummy: DISCBUY=0' ;

      label MARRIED0 = 'Dummy: MARRIED=0' ;

      label OWNHOME0 = 'Dummy: OWNHOME=0' ;

      label RETURN240 = 'Dummy: RETURN24=0' ;

      label SEXF = 'Dummy: SEX=F' ;

      label CLIMATE10 = 'Dummy: CLIMATE=10' ;

      label CLIMATE20 = 'Dummy: CLIMATE=20' ;

      label LOCA = 'Dummy: LOC=A' ;

      label LOCB = 'Dummy: LOC=B' ;

      label LOCC = 'Dummy: LOC=C' ;

      label LOCD = 'Dummy: LOC=D' ;

      label LOCE = 'Dummy: LOC=E' ;

      label LOCF = 'Dummy: LOC=F' ;

      label LOCG = 'Dummy: LOC=G' ;

      label ORGSRCC = 'Dummy: ORGSRC=C' ;

      label ORGSRCD = 'Dummy: ORGSRC=D' ;

      label ORGSRCI = 'Dummy: ORGSRC=I' ;

      label ORGSRCO = 'Dummy: ORGSRC=O' ;

      label ORGSRCP = 'Dummy: ORGSRC=P' ;

      label ORGSRCR = 'Dummy: ORGSRC=R' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_RESPOND = 'Into: RESPOND' ;

      label U_RESPOND = 'Unnormalized Into: RESPOND' ;

      label P_RESPOND1 = 'Predicted: RESPOND=1' ;

      label P_RESPOND0 = 'Predicted: RESPOND=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for COA6 ;
drop COA60 ;
if missing( COA6 ) then do;
   COA60 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( COA6 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      COA60 = 1;
   end;
   else if _dm12 = '1'  then do;
      COA60 = -1;
   end;
   else do;
      COA60 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for DISCBUY ;
drop DISCBUY0 ;
if missing( DISCBUY ) then do;
   DISCBUY0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( DISCBUY , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      DISCBUY0 = 1;
   end;
   else if _dm12 = '1'  then do;
      DISCBUY0 = -1;
   end;
   else do;
      DISCBUY0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for MARRIED ;
drop MARRIED0 ;
if missing( MARRIED ) then do;
   MARRIED0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( MARRIED , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      MARRIED0 = -1;
   end;
   else if _dm12 = '0'  then do;
      MARRIED0 = 1;
   end;
   else do;
      MARRIED0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OWNHOME ;
drop OWNHOME0 ;
if missing( OWNHOME ) then do;
   OWNHOME0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( OWNHOME , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      OWNHOME0 = 1;
   end;
   else if _dm12 = '1'  then do;
      OWNHOME0 = -1;
   end;
   else do;
      OWNHOME0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for RETURN24 ;
drop RETURN240 ;
if missing( RETURN24 ) then do;
   RETURN240 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( RETURN24 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      RETURN240 = 1;
   end;
   else if _dm12 = '1'  then do;
      RETURN240 = -1;
   end;
   else do;
      RETURN240 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for SEX ;
drop SEXF ;
if missing( SEX ) then do;
   SEXF = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm1 $ 1; drop _dm1 ;
   _dm1 = put( SEX , $CHAR1. );
   %DMNORMIP( _dm1 )
   if _dm1 = 'M'  then do;
      SEXF = -1;
   end;
   else if _dm1 = 'F'  then do;
      SEXF = 1;
   end;
   else do;
      SEXF = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for CLIMATE ;
drop CLIMATE10 CLIMATE20 ;
if missing( CLIMATE ) then do;
   CLIMATE10 = .;
   CLIMATE20 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm2 $ 2; drop _dm2 ;
   _dm2 = put( CLIMATE , $CHAR2. );
   %DMNORMIP( _dm2 )
   if _dm2 = '20'  then do;
      CLIMATE10 = 0;
      CLIMATE20 = 1;
   end;
   else if _dm2 = '30'  then do;
      CLIMATE10 = -1;
      CLIMATE20 = -1;
   end;
   else if _dm2 = '10'  then do;
      CLIMATE10 = 1;
      CLIMATE20 = 0;
   end;
   else do;
      CLIMATE10 = .;
      CLIMATE20 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for LOC ;
drop LOCA LOCB LOCC LOCD LOCE LOCF LOCG ;
*** encoding is sparse, initialize to zero;
LOCA = 0;
LOCB = 0;
LOCC = 0;
LOCD = 0;
LOCE = 0;
LOCF = 0;
LOCG = 0;
if missing( LOC ) then do;
   LOCA = .;
   LOCB = .;
   LOCC = .;
   LOCD = .;
   LOCE = .;
   LOCF = .;
   LOCG = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm1 $ 1; drop _dm1 ;
   _dm1 = put( LOC , $CHAR1. );
   %DMNORMIP( _dm1 )
   _dm_find = 0; drop _dm_find;
   if _dm1 <= 'D'  then do;
      if _dm1 <= 'B'  then do;
         if _dm1 = 'A'  then do;
            LOCA = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'B'  then do;
               LOCB = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm1 = 'C'  then do;
            LOCC = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'D'  then do;
               LOCD = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm1 <= 'F'  then do;
         if _dm1 = 'E'  then do;
            LOCE = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'F'  then do;
               LOCF = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm1 = 'G'  then do;
            LOCG = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'H'  then do;
               LOCA = -1;
               LOCB = -1;
               LOCC = -1;
               LOCD = -1;
               LOCE = -1;
               LOCF = -1;
               LOCG = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      LOCA = .;
      LOCB = .;
      LOCC = .;
      LOCD = .;
      LOCE = .;
      LOCF = .;
      LOCG = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for ORGSRC ;
drop ORGSRCC ORGSRCD ORGSRCI ORGSRCO ORGSRCP ORGSRCR ;
*** encoding is sparse, initialize to zero;
ORGSRCC = 0;
ORGSRCD = 0;
ORGSRCI = 0;
ORGSRCO = 0;
ORGSRCP = 0;
ORGSRCR = 0;
if missing( ORGSRC ) then do;
   ORGSRCC = .;
   ORGSRCD = .;
   ORGSRCI = .;
   ORGSRCO = .;
   ORGSRCP = .;
   ORGSRCR = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm1 $ 1; drop _dm1 ;
   _dm1 = put( ORGSRC , $CHAR1. );
   %DMNORMIP( _dm1 )
   _dm_find = 0; drop _dm_find;
   if _dm1 <= 'O'  then do;
      if _dm1 <= 'D'  then do;
         if _dm1 = 'C'  then do;
            ORGSRCC = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'D'  then do;
               ORGSRCD = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm1 = 'I'  then do;
            ORGSRCI = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'O'  then do;
               ORGSRCO = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm1 <= 'R'  then do;
         if _dm1 = 'P'  then do;
            ORGSRCP = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm1 = 'R'  then do;
               ORGSRCR = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm1 = 'U'  then do;
            ORGSRCC = -1;
            ORGSRCD = -1;
            ORGSRCI = -1;
            ORGSRCO = -1;
            ORGSRCP = -1;
            ORGSRCR = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      ORGSRCC = .;
      ORGSRCD = .;
      ORGSRCI = .;
      ORGSRCO = .;
      ORGSRCP = .;
      ORGSRCR = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AGE , 
   BUY12 , 
   BUY18 , 
   BUY6 , 
   FICO , 
   INCOME , 
   VALUE24   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AGE  =    -4.41220858751264 +     0.09911431652588 * AGE ;
   S_BUY12  =    -0.47495016976613 +     2.34774502953616 * BUY12 ;
   S_BUY18  =    -0.59899695416057 +     1.75743860578732 * BUY18 ;
   S_BUY6  =    -0.35938865799343 +     2.96941165974324 * BUY6 ;
   S_FICO  =    -23.7003109498374 +     0.03411600761233 * FICO ;
   S_INCOME  =     -2.9309588225649 +     0.06162016678243 * INCOME ;
   S_VALUE24  =    -1.65368962520984 +     0.00645651495403 * VALUE24 ;
END;
ELSE DO;
   IF MISSING( AGE ) THEN S_AGE  = . ;
   ELSE S_AGE  =    -4.41220858751264 +     0.09911431652588 * AGE ;
   IF MISSING( BUY12 ) THEN S_BUY12  = . ;
   ELSE S_BUY12  =    -0.47495016976613 +     2.34774502953616 * BUY12 ;
   IF MISSING( BUY18 ) THEN S_BUY18  = . ;
   ELSE S_BUY18  =    -0.59899695416057 +     1.75743860578732 * BUY18 ;
   IF MISSING( BUY6 ) THEN S_BUY6  = . ;
   ELSE S_BUY6  =    -0.35938865799343 +     2.96941165974324 * BUY6 ;
   IF MISSING( FICO ) THEN S_FICO  = . ;
   ELSE S_FICO  =    -23.7003109498374 +     0.03411600761233 * FICO ;
   IF MISSING( INCOME ) THEN S_INCOME  = . ;
   ELSE S_INCOME  =     -2.9309588225649 +     0.06162016678243 * INCOME ;
   IF MISSING( VALUE24 ) THEN S_VALUE24  = . ;
   ELSE S_VALUE24  =    -1.65368962520984 +     0.00645651495403 * VALUE24 ;
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
   H11  =    -1.63844613947577 * S_AGE  +     -0.0006834495316 * S_BUY12
          +    -1.11920941857236 * S_BUY18  +    -0.15449094415096 * S_BUY6
          +    -0.36108421052445 * S_FICO  +     0.29193651520759 * S_INCOME
          +    -0.53974295029901 * S_VALUE24 ;
   H12  =     2.04070186234985 * S_AGE  +    -0.82334081428811 * S_BUY12
          +     0.91553224280882 * S_BUY18  +    -0.50033050635957 * S_BUY6
          +    -1.43166253029579 * S_FICO  +     1.53196393911802 * S_INCOME
          +     1.17270711955564 * S_VALUE24 ;
   H13  =     0.84574733578473 * S_AGE  +     0.18802877429238 * S_BUY12
          +    -1.89191139981326 * S_BUY18  +     0.20058908494166 * S_BUY6
          +    -0.01161876595264 * S_FICO  +     1.03788205942031 * S_INCOME
          +    -0.04924604220188 * S_VALUE24 ;
   H11  = H11  +     -0.1988644311203 * COA60  +     0.68224787732582 * 
        DISCBUY0  +    -1.53390155389653 * MARRIED0  +     2.00437791742167 * 
        OWNHOME0  +     0.88877058553497 * RETURN240
          +    -0.90483360227295 * SEXF ;
   H12  = H12  +    -0.37262471971785 * COA60  +     -0.2049179662907 * 
        DISCBUY0  +     0.10126199387394 * MARRIED0  +    -1.51051913605472 * 
        OWNHOME0  +    -1.67939230329831 * RETURN240
          +      0.0498695322584 * SEXF ;
   H13  = H13  +     0.86228008872216 * COA60  +     0.61114127966391 * 
        DISCBUY0  +     0.04574756543432 * MARRIED0  +     0.55158128240389 * 
        OWNHOME0  +     0.19412426500861 * RETURN240
          +    -0.56321531111583 * SEXF ;
   H11  = H11  +      1.1818176049225 * CLIMATE10  +    -1.32058220720595 * 
        CLIMATE20  +    -0.58467627942889 * LOCA  +    -0.68972041678241 * 
        LOCB  +     0.30774237767357 * LOCC  +     1.53078886973103 * LOCD
          +    -0.34280592357562 * LOCE  +    -0.83618623857709 * LOCF
          +     0.01349481352948 * LOCG  +    -1.16955338386382 * ORGSRCC
          +      0.2455345729593 * ORGSRCD  +     1.08120148293387 * ORGSRCI
          +    -0.88297036165384 * ORGSRCO  +     1.00916264530826 * ORGSRCP
          +      0.9602561921295 * ORGSRCR ;
   H12  = H12  +    -0.12745978178409 * CLIMATE10  +    -1.00277157738408 * 
        CLIMATE20  +    -0.98868063297518 * LOCA  +    -0.96820178142632 * 
        LOCB  +     2.34325778788059 * LOCC  +    -0.45228620744141 * LOCD
          +     0.33681000164501 * LOCE  +    -0.53346358071112 * LOCF
          +     0.07322369931179 * LOCG  +     0.71346080215181 * ORGSRCC
          +    -0.15781793379033 * ORGSRCD  +    -4.85198276807088 * ORGSRCI
          +     1.76010505508802 * ORGSRCO  +     1.22048952682581 * ORGSRCP
          +     1.46892428056809 * ORGSRCR ;
   H13  = H13  +     0.09097091651634 * CLIMATE10  +     -0.3965639355109 * 
        CLIMATE20  +    -0.50515435042955 * LOCA  +     -0.6025682016322 * 
        LOCB  +    -0.21236281616384 * LOCC  +    -0.65003155376952 * LOCD
          +     0.75926680476961 * LOCE  +    -0.60543681094647 * LOCF
          +    -0.26230283406764 * LOCG  +    -0.73511454268996 * ORGSRCC
          +     0.75076149399272 * ORGSRCD  +     0.32730886330929 * ORGSRCI
          +    -0.05672858974123 * ORGSRCO  +    -0.33079089144214 * ORGSRCP
          +     1.35547292991141 * ORGSRCR ;
   H11  =     1.94012350352894 + H11 ;
   H12  =    -3.49518156519206 + H12 ;
   H13  =     1.19970335108207 + H13 ;
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
*** Writing the Node RESPOND ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_RESPOND1  =     1.24114471688656 * H11  +     0.68120616904803 * H12
          +     -1.0075458443965 * H13 ;
   P_RESPOND1  =     -2.2955746741664 + P_RESPOND1 ;
   P_RESPOND0  = 0; 
   _MAX_ = MAX (P_RESPOND1 , P_RESPOND0 );
   _SUM_ = 0.; 
   P_RESPOND1  = EXP(P_RESPOND1  - _MAX_);
   _SUM_ = _SUM_ + P_RESPOND1 ;
   P_RESPOND0  = EXP(P_RESPOND0  - _MAX_);
   _SUM_ = _SUM_ + P_RESPOND0 ;
   P_RESPOND1  = P_RESPOND1  / _SUM_;
   P_RESPOND0  = P_RESPOND0  / _SUM_;
END;
ELSE DO;
   P_RESPOND1  = .;
   P_RESPOND0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_RESPOND1  =     0.07431340872374;
   P_RESPOND0  =     0.92568659127625;
END;
*** *************************;
*** Writing the I_RESPOND  AND U_RESPOND ;
*** *************************;
_MAXP_ = P_RESPOND1 ;
I_RESPOND  = "1           " ;
U_RESPOND  =                    1;
IF( _MAXP_ LT P_RESPOND0  ) THEN DO; 
   _MAXP_ = P_RESPOND0 ;
   I_RESPOND  = "0           " ;
   U_RESPOND  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
