#trinity assembly
#Before using trinity or cufflinks we need to merge and sort the aligned .bam files from out HiSat2 mapping to each LRR and SRR genome.

#samtools merge the aligned LRR .bam files
samtools merge -@16 -O BAM bam/LRRmerged.bam bam/LRR_*.bam

#samtools sort the LRRmerged.bam file

samtools sort -@16 -o bam/LRRmerged_sorted.bam bam/LRRmerged.bam

#samtools merge the aligned SRR .bam files
samtools merge -@16 -O BAM bam/SRRmerged.bam bam/bam/SRR_*.bam

#samtools sort the SRRmerged.bam file

samtools sort -@16 -o bam/SRRmerged_sorted.bam bam/SRRmerged.bam

###########################################################################################

#Trinity LRR assembly
Trinity --genome_guided_bam SRRmerged_sorted.bam --genome_guided_max_intron 20000 --max_memory 28G --CPU 15

#Trinity SRR assembly
Trinity --genome_guided_bam SRRmerged_sorted.bam --genome_guided_max_intron 20000 --max_memory 28G --CPU 15


#cufflinks for SRR
cufflinks -u -I 20000 -p 15 --library-type fr-secondstrand SRRmerged_sorted.bam 
