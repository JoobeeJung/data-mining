%tmc_doc_score(import=&em_score_output,export=work._newexport,
termds=termloc.TextFilter_filtterms, configds=termloc.TextCluster3_tmconfig,
clusters=termloc.TextCluster3_clusters, emoutstat=termloc.TextCluster3_emoutstat,
_scrout=work.TextFilter_out, svd_u=termloc.TextCluster3_svd_u, svd_s=termloc.TextCluster3_svd_s, prefix=TextCluster3);
data &em_score_output; set work._newexport;
