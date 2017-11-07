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
BAM=bam/C1_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/C1_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001848_1.fastq.gz
R2=reads/SRR5001848_2.fastq.gz
BAM=bam/C2_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/C2_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001850_1.fastq.gz
R2=reads/SRR5001850_2.fastq.gz
BAM=bam/C3_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/C3_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001844_1.fastq.gz
R2=reads/SRR5001844_2.fastq.gz
BAM=bam/T1_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/T1_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001847_1.fastq.gz
R2=reads/SRR5001847_2.fastq.gz
BAM=bam/T2_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/T2_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM

R1=reads/SRR5001846_1.fastq.gz
R2=reads/SRR5001846_2.fastq.gz
BAM=bam/T3_SRR.bam
hisat2 -p 16 -x $IDXSRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM
BAM=bam/T3_LRR.bam
hisat2 -p 16 -x $IDXLRR -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort -l 1.6G -@16 > $BAM 2>> $RUNLOG
samtools index -@16 $BAM


