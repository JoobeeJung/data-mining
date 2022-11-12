****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_RESPOND  $   12;
LENGTH I_RESPOND  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_RESPOND0 = 'Predicted: RESPOND=0' ;
label P_RESPOND1 = 'Predicted: RESPOND=1' ;
label Q_RESPOND0 = 'Unadjusted P: RESPOND=0' ;
label Q_RESPOND1 = 'Unadjusted P: RESPOND=1' ;
label V_RESPOND0 = 'Validated: RESPOND=0' ;
label V_RESPOND1 = 'Validated: RESPOND=1' ;
label R_RESPOND0 = 'Residual: RESPOND=0' ;
label R_RESPOND1 = 'Residual: RESPOND=1' ;
label F_RESPOND = 'From: RESPOND' ;
label I_RESPOND = 'Into: RESPOND' ;
label U_RESPOND = 'Unnormalized Into: RESPOND' ;
label _WARN_ = '°æ°í' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
 
 
_ARBFMT_12 = PUT( RESPOND , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_RESPOND );
 
******             ASSIGN OBSERVATION TO NODE             ******;
_NODE_  =                    1;
_LEAF_  =                    1;
P_RESPOND0  =     0.92323080770192;
P_RESPOND1  =     0.07676919229807;
Q_RESPOND0  =     0.92323080770192;
Q_RESPOND1  =     0.07676919229807;
V_RESPOND0  =     0.92333333333333;
V_RESPOND1  =     0.07666666666666;
I_RESPOND  = '0' ;
U_RESPOND  =                    0;
 
*****  RESIDUALS R_ *************;
IF  F_RESPOND  NE '0'
AND F_RESPOND  NE '1'  THEN DO;
        R_RESPOND0  = .;
        R_RESPOND1  = .;
 END;
 ELSE DO;
       R_RESPOND0  =  -P_RESPOND0 ;
       R_RESPOND1  =  -P_RESPOND1 ;
       SELECT( F_RESPOND  );
          WHEN( '0'  ) R_RESPOND0  = R_RESPOND0  +1;
          WHEN( '1'  ) R_RESPOND1  = R_RESPOND1  +1;
       END;
 END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
