****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
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
label I_RESPOND = 'Into: RESPOND' ;
label U_RESPOND = 'Unnormalized Into: RESPOND' ;
label _WARN_ = '°æ°í' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_2 $      2; DROP _ARBFMT_2; 
_ARBFMT_2 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(BUY18 ) AND 
                   0.5 <= BUY18  THEN DO;
  IF  NOT MISSING(IMP_AGE ) AND 
    IMP_AGE  <                 31.5 THEN DO;
    _ARBFMT_2 = PUT( CLIMATE , $CHAR2.);
     %DMNORMIP( _ARBFMT_2);
    IF _ARBFMT_2 IN ('20' ) THEN DO;
      _ARBFMT_12 = PUT( IMP_OWNHOME , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('1' ) THEN DO;
        _NODE_  =                   18;
        _LEAF_  =                    3;
        P_RESPOND0  =     0.88235294117647;
        P_RESPOND1  =     0.11764705882352;
        Q_RESPOND0  =     0.88235294117647;
        Q_RESPOND1  =     0.11764705882352;
        V_RESPOND0  =      0.8235294117647;
        V_RESPOND1  =     0.17647058823529;
        I_RESPOND  = '0' ;
        U_RESPOND  =                    0;
        END;
      ELSE DO;
        IF  NOT MISSING(BUY18 ) AND 
                           1.5 <= BUY18  THEN DO;
          _NODE_  =                   25;
          _LEAF_  =                    6;
          P_RESPOND0  =     0.81818181818181;
          P_RESPOND1  =     0.18181818181818;
          Q_RESPOND0  =     0.81818181818181;
          Q_RESPOND1  =     0.18181818181818;
          V_RESPOND0  =                 0.75;
          V_RESPOND1  =                 0.25;
          I_RESPOND  = '0' ;
          U_RESPOND  =                    0;
          END;
        ELSE DO;
          IF  NOT MISSING(IMP_AGE ) AND 
                            30.5 <= IMP_AGE  THEN DO;
            _NODE_  =                   29;
            _LEAF_  =                    5;
            P_RESPOND0  =                  0.6;
            P_RESPOND1  =                  0.4;
            Q_RESPOND0  =                  0.6;
            Q_RESPOND1  =                  0.4;
            V_RESPOND0  =     0.66666666666666;
            V_RESPOND1  =     0.33333333333333;
            I_RESPOND  = '0' ;
            U_RESPOND  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   28;
            _LEAF_  =                    4;
            P_RESPOND0  =                    0;
            P_RESPOND1  =                    1;
            Q_RESPOND0  =                    0;
            Q_RESPOND1  =                    1;
            V_RESPOND0  =                    0;
            V_RESPOND1  =                    1;
            I_RESPOND  = '1' ;
            U_RESPOND  =                    1;
            END;
          END;
        END;
      END;
    ELSE DO;
      _NODE_  =                   12;
      _LEAF_  =                    2;
      P_RESPOND0  =     0.83636363636363;
      P_RESPOND1  =     0.16363636363636;
      Q_RESPOND0  =     0.83636363636363;
      Q_RESPOND1  =     0.16363636363636;
      V_RESPOND0  =     0.89655172413793;
      V_RESPOND1  =     0.10344827586206;
      I_RESPOND  = '0' ;
      U_RESPOND  =                    0;
      END;
    END;
  ELSE DO;
    _NODE_  =                    7;
    _LEAF_  =                    7;
    P_RESPOND0  =     0.90502793296089;
    P_RESPOND1  =      0.0949720670391;
    Q_RESPOND0  =     0.90502793296089;
    Q_RESPOND1  =      0.0949720670391;
    V_RESPOND0  =     0.91058823529411;
    V_RESPOND1  =     0.08941176470588;
    I_RESPOND  = '0' ;
    U_RESPOND  =                    0;
    END;
  END;
ELSE DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_RESPOND0  =     0.93699115044247;
  P_RESPOND1  =     0.06300884955752;
  Q_RESPOND0  =     0.93699115044247;
  Q_RESPOND1  =     0.06300884955752;
  V_RESPOND0  =     0.93701923076923;
  V_RESPOND1  =     0.06298076923076;
  I_RESPOND  = '0' ;
  U_RESPOND  =                    0;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

