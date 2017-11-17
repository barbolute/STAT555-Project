#trinity assembly

###########################################################################################

#Trinity LRR assembly
Trinity --genome_guided_bam bam/LRRmerged_sorted.bam --genome_guided_max_intron 20000 --max_memory 28G --CPU 15

#Trinity SRR assembly
Trinity --genome_guided_bam bam/SRRmerged_sorted.bam --genome_guided_max_intron 20000 --max_memory 28G --CPU 15


#cufflinks for SRR
cufflinks -u -I 20000 -p 15 --library-type fr-secondstrand SRRmerged_sorted.bam 
