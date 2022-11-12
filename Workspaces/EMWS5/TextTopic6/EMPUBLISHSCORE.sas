/* First we create a Weighted TMOUT Data Set based on weighted terms*/
proc tmutil data=work.TextFilter7_out key=termloc.TextFilter7_filtterms;
control init release;
weight cellwgt=LOG in_weight=termloc.TextFilter7_filtterms (keep=key weight);
output out=work._weighted_tmout;

%row_pivot_normalize(transds=work._weighted_tmout, outtransds=WORK.TMOUTNORM,
      col_sumds=work._termsumds,row=_document_,col=_termnum_,entry=_count_,
      pivot=0.7,tmt_config=termloc.TextFilter7_tmconfig,tmt_train=0,prefix=TextTopic6);

/*initialize topics and termtopics datasets in case they do not exist (0 topics case)*/
%macro tmt_check_topics_exist;
%if(^%sysfunc(exist(termloc.TextTopic6_topics))) %then %do;
   proc sql noprint; create table termloc.TextTopic6_topics
   (_topicid decimal, _docCutoff decimal, _termCutoff decimal, _name char(1024), _cat char(4), /* _apply char(1), */ _numterms decimal, _numdocs decimal, _displayCat char(200) );
   quit;
%end;
%if(^%sysfunc(exist(termloc.TextTopic6_termtopics))) %then %do;
   proc sql noprint; create table termloc.TextTopic6_termtopics
   (_topicid decimal, _weight decimal, _termid decimal);
   quit;
%end;
%mend tmt_check_topics_exist;
%tmt_check_topics_exist;
data work.TextTopic6_termtopics; set termloc.TextTopic6_termtopics; run;
data work.TextTopic6_topics; set termloc.TextTopic6_topics; run;
%tmt_doc_score(termtopds=work.TextTopic6_termtopics, docds=&em_score_output,
outds=WORK.TMOUTNORM, topicds=work.TextTopic6_topics, newdocds=work._newdocds, scoring=yes,
termsumds=work._termsumds, prefix=TextTopic6_,pivot=0.7);
data &em_score_output; set work._newdocds;
