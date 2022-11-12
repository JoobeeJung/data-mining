%macro main;

   %if %upcase(&EM_ACTION) = CREATE %then %do;
       filename temp catalog 'sashelp.hpdm.hpsvm_create.source';
       %include temp;
       filename temp;
       %hpdm_hpsvm_create;
   %end;

   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;
       filename temp catalog 'sashelp.hpdm.hpsvm_train.source';
       %include temp;
       filename temp;
       %hpdm_hpsvm_train;
   %end;

   %else
   %if %upcase(&EM_ACTION) = REPORT %then %do;
       filename temp catalog 'sashelp.hpdm.hpsvm_report.source';
       %include temp;
       filename temp;
       %hpdm_hpsvm_report;
   %end;


   %else
   %if %upcase(&EM_ACTION) = SCORE %then %do;
       filename temp catalog 'sashelp.hpdm.hpsvm_score.source';
       %include temp;
       filename temp;
       %hpdm_hpsvm_score;
   %end;


%mend main;

%main;


