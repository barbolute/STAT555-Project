# A script that fully automates the RNA-seq analysis of the samples in this study.
#

# Stop on any error.
set -ueo pipefail

# This is the reference genome.
REFSRR=SRR.fa
REFLRR=LRR.fa

# The names for the index.
IDXSRR=SRR.fa
IDXLRR=LRR.fa

# The files containint genomic coordinate.
GFFSRR=SRR.gff
GFFLRR=LRR.fa

fastq-dump --gzip --split-files -X 10000 -O reads SRR5001851
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001848
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001850
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001844
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001847
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001846

# Download and unpack the data
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/008/985/GCA_002008985.2_Tgut_diploid_1.0/GCA_002008985.2_Tgut_diploid_1.0_genomic.fna.gz
echo "*** Downloading: $URL"
curl -s $URL | tar zxv

# Build the indices
echo "*** Building hisat indices: $IDX_ERCC and $IDX_HUMAN"
hisat2-build $REF_ERCC $IDX_ERCC 1>runlog.txt 2> runlog.txt
hisat2-build $REF_HUMAN $IDX_HUMAN 1>>runlog.txt 2>> runlog.txt
