%tmc_doc_score(import=&em_score_output,export=work._newexport,
      termds=termloc.TextFilter5_filtterms,configds=termloc.TextCluster5_tmconfig,
      clusters=termloc.TextCluster5_clusters, 
      _scrout=work.TextFilter5_out, svd_u=termloc.TextCluster5_svd_u, svd_s=termloc.TextCluster5_svd_s, prefix=TextCluster5);
data &em_score_output; set work._newexport;
