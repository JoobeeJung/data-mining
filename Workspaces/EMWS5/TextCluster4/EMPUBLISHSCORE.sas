%tmc_doc_score(import=&em_score_output,export=work._newexport,
      termds=termloc.TextFilter3_filtterms,configds=termloc.TextCluster4_tmconfig,
      clusters=termloc.TextCluster4_clusters, 
      _scrout=work.TextFilter3_out, svd_u=termloc.TextCluster4_svd_u, svd_s=termloc.TextCluster4_svd_s, prefix=TextCluster4);
data &em_score_output; set work._newexport;
