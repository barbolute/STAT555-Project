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

R1=reads/SRR5001851_1.fastq.gz
R2=reads/SRR5001851_2.fastq.gz
BAM=bam/SRR_C1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C1.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001848_1.fastq.gz
R2=reads/SRR5001848_2.fastq.gz
BAM=bam/SRR_C2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C2.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001850_1.fastq.gz
R2=reads/SRR5001850_2.fastq.gz
BAM=bam/SRR_C3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_C3.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001844_1.fastq.gz
R2=reads/SRR5001844_2.fastq.gz
BAM=bam/SRR_T1.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T1.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001847_1.fastq.gz
R2=reads/SRR5001847_2.fastq.gz
BAM=bam/SRR_T2.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T2.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001846_1.fastq.gz
R2=reads/SRR5001846_2.fastq.gz
BAM=bam/SRR_T3.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/LRR_T3.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM


