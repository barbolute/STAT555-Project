#trinity assembly of LRR
#

#samtools merge -@16 -O BAM merged.bam bam/LRR_*.bam


Trinity --genome_guided_bam bam/LRR_*.bam --genome_guided_max_intron 20000 --max_memory_28G --CPU 15


--max_memoory 30G

--left

--right

--genome_guided_bam

--genome_guided_max_intron 10000
