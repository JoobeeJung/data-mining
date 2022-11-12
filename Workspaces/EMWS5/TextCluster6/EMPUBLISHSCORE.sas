%tmc_doc_score(import=&em_score_output,export=work._newexport,
      termds=termloc.TextFilter6_filtterms,configds=termloc.TextCluster6_tmconfig,
      clusters=termloc.TextCluster6_clusters, 
      _scrout=work.TextFilter6_out, svd_u=termloc.TextCluster6_svd_u, svd_s=termloc.TextCluster6_svd_s, prefix=TextCluster6);
data &em_score_output; set work._newexport;
