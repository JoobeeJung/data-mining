/* First we create a Weighted TMOUT Data Set based on weighted terms*/
proc tmutil data=work.TextFilter5_out key=termloc.TextFilter5_filtterms;
control init release;
weight cellwgt=LOG in_weight=termloc.TextFilter5_filtterms (keep=key weight);
output out=work._weighted_tmout;

%row_pivot_normalize(transds=work._weighted_tmout, outtransds=WORK.TMOUTNORM,
      col_sumds=work._termsumds,row=_document_,col=_termnum_,entry=_count_,
      pivot=0.7,tmt_config=termloc.TextFilter5_tmconfig,tmt_train=0,prefix=TextTopic4);

/*initialize topics and termtopics datasets in case they do not exist (0 topics case)*/
%macro tmt_check_topics_exist;
%if(^%sysfunc(exist(termloc.TextTopic4_topics))) %then %do;
   proc sql noprint; create table termloc.TextTopic4_topics
   (_topicid decimal, _docCutoff decimal, _termCutoff decimal, _name char(1024), _cat char(4), /* _apply char(1), */ _numterms decimal, _numdocs decimal, _displayCat char(200) );
   quit;
%end;
%if(^%sysfunc(exist(termloc.TextTopic4_termtopics))) %then %do;
   proc sql noprint; create table termloc.TextTopic4_termtopics
   (_topicid decimal, _weight decimal, _termid decimal);
   quit;
%end;
%mend tmt_check_topics_exist;
%tmt_check_topics_exist;
data work.TextTopic4_termtopics; set termloc.TextTopic4_termtopics; run;
data work.TextTopic4_topics; set termloc.TextTopic4_topics; run;
%tmt_doc_score(termtopds=work.TextTopic4_termtopics, docds=&em_score_output,
outds=WORK.TMOUTNORM, topicds=work.TextTopic4_topics, newdocds=work._newdocds, scoring=yes,
termsumds=work._termsumds, prefix=TextTopic4_,pivot=0.7);
data &em_score_output; set work._newdocds;
