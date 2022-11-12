******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_LOC begin----*/
length _NORM1 $ 1;
_NORM1 = put( LOC , $CHAR1. );
%DMNORMIP( _NORM1 )
drop _NORM1;
select(_NORM1);
  when('A' ) G_LOC = 2;
  when('B' ) G_LOC = 3;
  when('C' ) G_LOC = 0;
  when('D' ) G_LOC = 1;
  when('E' ) G_LOC = 3;
  when('F' ) G_LOC = 4;
  when('G' ) G_LOC = 2;
  when('H' ) G_LOC = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_LOC="Grouped Levels for  LOC";
/*----LOC end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
