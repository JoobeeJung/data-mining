****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_BAD  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_BAD1 = 'Predicted: BAD=1' ;
label P_BAD0 = 'Predicted: BAD=0' ;
label Q_BAD1 = 'Unadjusted P: BAD=1' ;
label Q_BAD0 = 'Unadjusted P: BAD=0' ;
label V_BAD1 = 'Validated: BAD=1' ;
label V_BAD0 = 'Validated: BAD=0' ;
label I_BAD = 'Into: BAD' ;
label U_BAD = 'Unnormalized Into: BAD' ;
label _WARN_ = '°æ°í' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_7 $      7; DROP _ARBFMT_7;
_ARBFMT_7 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(DEBTINC ) AND
      11.7112154734233 <= DEBTINC  AND
  DEBTINC  <     41.0927802636277 THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    8;
  P_BAD1  =     0.05902899056933;
  P_BAD0  =     0.94097100943066;
  Q_BAD1  =     0.05902899056933;
  Q_BAD0  =     0.94097100943066;
  V_BAD1  =     0.06425702811244;
  V_BAD0  =     0.93574297188755;
  I_BAD  = '0' ;
  U_BAD  =                    0;
  END;
ELSE IF  NOT MISSING(DEBTINC ) AND
      41.0927802636277 <= DEBTINC  AND
  DEBTINC  <     45.1848045236243 THEN DO;
  _NODE_  =                    4;
  _LEAF_  =                    9;
  P_BAD1  =     0.13988095238095;
  P_BAD0  =     0.86011904761904;
  Q_BAD1  =     0.13988095238095;
  Q_BAD0  =     0.86011904761904;
  V_BAD1  =     0.11940298507462;
  V_BAD0  =     0.88059701492537;
  I_BAD  = '0' ;
  U_BAD  =                    0;
  END;
ELSE IF  NOT MISSING(DEBTINC ) AND
      45.1848045236243 <= DEBTINC  THEN DO;
  _NODE_  =                    5;
  _LEAF_  =                   10;
  P_BAD1  =     0.96363636363636;
  P_BAD0  =     0.03636363636363;
  Q_BAD1  =     0.96363636363636;
  Q_BAD0  =     0.03636363636363;
  V_BAD1  =     0.96296296296296;
  V_BAD0  =     0.03703703703703;
  I_BAD  = '1' ;
  U_BAD  =                    1;
  END;
ELSE DO;
  IF  NOT MISSING(DELINQ ) AND
                     0.5 <= DELINQ  AND
    DELINQ  <                  2.5 THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    6;
    P_BAD1  =     0.74384236453201;
    P_BAD0  =     0.25615763546798;
    Q_BAD1  =     0.74384236453201;
    Q_BAD0  =     0.25615763546798;
    V_BAD1  =     0.81651376146789;
    V_BAD0  =     0.18348623853211;
    I_BAD  = '1' ;
    U_BAD  =                    1;
    END;
  ELSE IF  NOT MISSING(DELINQ ) AND
                     2.5 <= DELINQ  THEN DO;
    _NODE_  =                    8;
    _LEAF_  =                    7;
    P_BAD1  =     0.95275590551181;
    P_BAD0  =     0.04724409448818;
    Q_BAD1  =     0.95275590551181;
    Q_BAD0  =     0.04724409448818;
    V_BAD1  =     0.81578947368421;
    V_BAD0  =     0.18421052631578;
    I_BAD  = '1' ;
    U_BAD  =                    1;
    END;
  ELSE DO;
    IF  NOT MISSING(CLAGE ) AND
                     154.7 <= CLAGE  THEN DO;
      IF  NOT MISSING(YOJ ) AND
        YOJ  <                 1.15 THEN DO;
        _NODE_  =                   32;
        _LEAF_  =                    4;
        P_BAD1  =     0.58333333333333;
        P_BAD0  =     0.41666666666666;
        Q_BAD1  =     0.58333333333333;
        Q_BAD0  =     0.41666666666666;
        V_BAD1  =     0.58333333333333;
        V_BAD0  =     0.41666666666666;
        I_BAD  = '1' ;
        U_BAD  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   33;
        _LEAF_  =                    5;
        P_BAD1  =      0.2822966507177;
        P_BAD0  =     0.71770334928229;
        Q_BAD1  =      0.2822966507177;
        Q_BAD0  =     0.71770334928229;
        V_BAD1  =     0.34065934065934;
        V_BAD0  =     0.65934065934065;
        I_BAD  = '0' ;
        U_BAD  =                    0;
        END;
      END;
    ELSE DO;
      _ARBFMT_7 = PUT( REASON , $7.);
       %DMNORMIP( _ARBFMT_7);
      IF _ARBFMT_7 IN ('DEBTCON' ) THEN DO;
        _NODE_  =                   29;
        _LEAF_  =                    1;
        P_BAD1  =     0.61421319796954;
        P_BAD0  =     0.38578680203045;
        Q_BAD1  =     0.61421319796954;
        Q_BAD0  =     0.38578680203045;
        V_BAD1  =     0.49350649350649;
        V_BAD0  =      0.5064935064935;
        I_BAD  = '1' ;
        U_BAD  =                    1;
        END;
      ELSE IF _ARBFMT_7 IN ('HOMEIMP' ) THEN DO;
        _NODE_  =                   30;
        _LEAF_  =                    2;
        P_BAD1  =     0.69827586206896;
        P_BAD0  =     0.30172413793103;
        Q_BAD1  =     0.69827586206896;
        Q_BAD0  =     0.30172413793103;
        V_BAD1  =                 0.78;
        V_BAD0  =                 0.22;
        I_BAD  = '1' ;
        U_BAD  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   31;
        _LEAF_  =                    3;
        P_BAD1  =     0.28571428571428;
        P_BAD0  =     0.71428571428571;
        Q_BAD1  =     0.28571428571428;
        Q_BAD0  =     0.71428571428571;
        V_BAD1  =     0.14285714285714;
        V_BAD0  =     0.85714285714285;
        I_BAD  = '0' ;
        U_BAD  =                    0;
        END;
      END;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;
