# A script that fully automates the RNA-seq analysis of the samples in this study.
#

# Stop on any error.
set -ueo pipefail

# This is the reference genome.
REF=SRR.fa

# The names for the index.
IDX=SRR.fa


# The files containint genomic coordinate.
GTF_HUMAN=refs/22.gtf
GTF_ERCC=refs/ERCC92.gtf

# Download and unpack the data
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/008/985/GCA_002008985.2_Tgut_diploid_1.0/GCA_002008985.2_Tgut_diploid_1.0_genomic.fna.gz
echo "*** Downloading: $URL"
curl -s $URL | tar zxv

# Build the indices
echo "*** Building hisat indices: $IDX_ERCC and $IDX_HUMAN"
hisat2-build $REF_ERCC $IDX_ERCC 1>runlog.txt 2> runlog.txt
hisat2-build $REF_HUMAN $IDX_HUMAN 1>>runlog.txt 2>> runlog.txt
