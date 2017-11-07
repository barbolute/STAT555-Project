# Stop this script on any error.
set -euo pipefail

# The gene feature file
GTFSRR=srr/SRR.gff
GTFLRR=lrr/LRR.gff

# Collect the output of commands here.
RUNLOG=runlog.txt

echo "*** Counting features with: $GTFSRR"
featureCounts -F GTF -a $GTFSRR -g gene_name -o counts.txt  bam/SRR_C*.bam  bam/SRR_T*.bam 2>> $RUNLOG

echo "*** Generating simple counts."
cat counts.txt | cut -f 1,7-12 > simple_counts.txt

echo "*** Running DESeq1."
curl -s -O http://data.biostarhandbook.com/rnaseq/code/deseq1.r
cat simple_counts.txt | Rscript deseq1.r 3x3 > results_deseq1.txt  2>> $RUNLOG

echo "*** Running DESeq2."
curl -s -O http://data.biostarhandbook.com/rnaseq/code/deseq2.r
cat simple_counts.txt | Rscript deseq2.r 3x3 > results_deseq2.txt  2>> $RUNLOG

echo "*** Running EdgeR."
curl -s -O http://data.biostarhandbook.com/rnaseq/code/edger.r
cat simple_counts.txt | Rscript edger.r 3x3 > results_edger.txt  2>> $RUNLOG
