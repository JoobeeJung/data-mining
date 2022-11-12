*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize FASHION ;
drop T_FASHION ;
if missing( FASHION ) then T_FASHION = .;
else T_FASHION = (FASHION - 92.2626995645863) * 0.03065953341998;

*** Standardize LEISURE ;
drop T_LEISURE ;
if missing( LEISURE ) then T_LEISURE = .;
else T_LEISURE = (LEISURE - 1916.41944847605) * 0.00285030242944;

*** Standardize ORIGINAL ;
drop T_ORIGINAL ;
if missing( ORIGINAL ) then T_ORIGINAL = .;
else T_ORIGINAL = (ORIGINAL - 1849.38461538461) * 0.00342926149831;

*** Standardize STRETCH ;
drop T_STRETCH ;
if missing( STRETCH ) then T_STRETCH = .;
else T_STRETCH = (STRETCH - 444.040638606676) * 0.00472388552856;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = '세그먼트 ID' ;
label Distance = '거리' ;
array CLUSvads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUSvads [_vqclus] = 0; end;
if not missing( T_FASHION ) then do;
   CLUSvads [1] + ( T_FASHION - 1.39169682646132 )**2;
   CLUSvads [2] + ( T_FASHION - -0.26416508540017 )**2;
   CLUSvads [3] + ( T_FASHION - -0.32042834050545 )**2;
   CLUSvads [4] + ( T_FASHION - -0.32458554018432 )**2;
   CLUSvads [5] + ( T_FASHION - -2.69996128035451 )**2;
end;
else _vqmvar + 1;
if not missing( T_LEISURE ) then do;
   CLUSvads [1] + ( T_LEISURE - 0.0356328130709 )**2;
   CLUSvads [2] + ( T_LEISURE - -0.83215515199873 )**2;
   CLUSvads [3] + ( T_LEISURE - -0.41237033427006 )**2;
   CLUSvads [4] + ( T_LEISURE - 0.99614637840524 )**2;
   CLUSvads [5] + ( T_LEISURE - -3.06812096909752 )**2;
end;
else _vqmvar + 1;
if not missing( T_ORIGINAL ) then do;
   CLUSvads [1] + ( T_ORIGINAL - 0.05803934942061 )**2;
   CLUSvads [2] + ( T_ORIGINAL - 0.34591311791534 )**2;
   CLUSvads [3] + ( T_ORIGINAL - 0.83752150595527 )**2;
   CLUSvads [4] + ( T_ORIGINAL - -0.86236523081008 )**2;
   CLUSvads [5] + ( T_ORIGINAL - -2.77696320346862 )**2;
end;
else _vqmvar + 1;
if not missing( T_STRETCH ) then do;
   CLUSvads [1] + ( T_STRETCH - -0.14353980780568 )**2;
   CLUSvads [2] + ( T_STRETCH - 1.40997665299091 )**2;
   CLUSvads [3] + ( T_STRETCH - -0.4705277370301 )**2;
   CLUSvads [4] + ( T_STRETCH - -0.33169501306098 )**2;
   CLUSvads [5] + ( T_STRETCH - -0.60579409688778 )**2;
end;
else _vqmvar + 1;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 1.8189894035458E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
