# Exit this script on any error.
set -euo pipefail

# This keeps track of the messages printed during execution.
RUNLOG=runlog.txt
echo "Run by `whoami` on `date`" > $RUNLOG

# Create output folder
mkdir -p bam

# The index determines what the data is aligned against.
IDXSRR=srr/SRR.fa
IDXLRR=lrr/LRR.fa

#Align Control 1 Sample
R1=rawdata/SRR5001851_1.fastq.gz
R2=rawdata/SRR5001851_2.fastq.gz
BAM=bam/SRR_C1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C1.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Control 2 Sample
R1=rawdata/SRR5001848_1.fastq.gz
R2=rawdata/SRR5001848_2.fastq.gz
BAM=bam/SRR_C2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C2.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Control 3 Sample
R1=rawdata/SRR5001850_1.fastq.gz
R2=rawdata/SRR5001850_2.fastq.gz
BAM=bam/SRR_C3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C3.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Treatment 1 Sample
R1=rawdata/SRR5001844_1.fastq.gz
R2=rawdata/SRR5001844_2.fastq.gz
BAM=bam/SRR_T1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T1.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Treatment 2 Sample
R1=rawdata/SRR5001847_1.fastq.gz
R2=rawdata/SRR5001847_2.fastq.gz
BAM=bam/SRR_T2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T2.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Treatment 3 Sample
R1=rawdata/SRR5001846_1.fastq.gz
R2=rawdata/SRR5001846_2.fastq.gz
BAM=bam/SRR_T3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T3.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align Brain Sample
R1=rawdata/SRR1619467_1.fastq.gz
R2=rawdata/SRR1619467_2.fastq.gz
BAM=bam/SRR_brain.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_brain.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align muscle samle
R1=rawdata/SRR2545947_1.fastq.gz
R2=rawdata/SRR2545947_2.fastq.gz
BAM=bam/SRR_muscle.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_muscle.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Align G226 sample
R1=rawdata/SRR1564481_1.fastq.gz
R2=rawdata/SRR1564481_2.fastq.gz
BAM=bam/SRR_G226.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_G226.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#align ZFTNA data
R1=rawdata/SRR1564483_1.fastq.gz
R2=rawdata/SRR1564483_2.fastq.gz
BAM=bam/SRR_ZFTNA.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_ZFTNA.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

#Before using trinity or cufflinks for assembly we need to merge and sort the aligned .bam files from out HiSat2 mapping to each LRR and SRR genome.
#samtools merge and sort all the aligned LRR .bam files into one LRRmerged_sorted.bam
samtools merge -@16 -O BAM bam/LRRmerged.bam bam/LRR_*.bam
samtools sort -l 1.8G -@16 -o bam/LRRmerged_sorted.bam bam/LRRmerged.bam

#samtools merge and sort all aligned SRR .bam files into one SRRmerged_sorted.bam
samtools merge -@16 -O BAM bam/SRRmerged.bam /bam/SRR_*.bam
samtools sort -l 1.8G -@16 -o bam/SRRmerged_sorted.bam bam/SRRmerged.bam

#Move onto trinityassembly.sh


