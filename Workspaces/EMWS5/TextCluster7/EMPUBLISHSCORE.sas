%tmc_doc_score(import=&em_score_output,export=work._newexport,
      termds=termloc.TextFilter7_filtterms,configds=termloc.TextCluster7_tmconfig,
      clusters=termloc.TextCluster7_clusters, 
      _scrout=work.TextFilter7_out, svd_u=termloc.TextCluster7_svd_u, svd_s=termloc.TextCluster7_svd_s, prefix=TextCluster7);
data &em_score_output; set work._newexport;
