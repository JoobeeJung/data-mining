*------------------------------------------------------------*;
* 데이터소스 설정;
*------------------------------------------------------------*;
libname EMWS6 "C:\Users\Administrator\DM_Proj\DataMining2018\Workspaces\EMWS6";
*------------------------------------------------------------*;
* Ids: DATA 데이터 생성;
*------------------------------------------------------------*;
data EMWS6.Ids_DATA (label="")
/ view=EMWS6.Ids_DATA
;
set DM_LIB.BUYTEST;
run;
