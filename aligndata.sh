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

for SAMPLE in HBR UHR;
do
    for REPLICATE in 1 2 3;
    do
        # Build the name of the files.
        R1=reads/${SAMPLE}_${REPLICATE}_R1.fq
        R2=reads/${SAMPLE}_${REPLICATE}_R2.fq
        BAM=bam/${SAMPLE}_${REPLICATE}.bam

        # Run the aligner.
        echo "*** Aligning: $BAM"
        hisat2 $IDX -1 $R1 -2 $R2 2>> $RUNLOG | samtools sort > $BAM 2>> $RUNLOG
        samtools index $BAM
    done
done
