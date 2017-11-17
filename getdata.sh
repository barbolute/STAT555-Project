# This script that fully automates the downloading of all data and hisat2 indexing in this study.
#

# Stop on any error.
set -ueo pipefail

# Create output folders
mkdir -p srr
mkdir -p lrr


# This is the reference genome.
REFSRR=srr/SRR.fa*
REFLRR=lrr/LRR.fa*

# The names for the index.
IDXSRR=srr/SRR.fa
IDXLRR=lrr/LRR.fa

# The files containint genomic coordinate.
GFFSRR=srr/SRR.gff*
GFFLRR=lrr/LRR.gff*

# Download and unpack the raw RNA-Seq Data for the DE part of experiment
#from spleen
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001851
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001848
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001850
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001844
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001847
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001846

#from brain for mapping based transcriptome assembly
fastq-dump --gzip --split-files -O assemblydata SRR1619467

#from muscle tissue for mapping based transcriptome assembly
fastq-dump --gzip --split-files -O assemblydata SRR2545947

#from G226 Zebra Finch Cell Line for mapping based transcriptome assembly
fastq-dump --gzip --split-files -O assemblydata SRR1564481

#from ZFTNA Zebra Finch Cell Line for mapping based transcriptome assembly
fastq-dump --gzip --split-files -O assemblydata SRR1564483

ls

# Download and unpack the short read reference genome and gff file.
URL1=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/151/805/GCA_000151805.2_Taeniopygia_guttata-3.2.4/GCA_000151805.2_Taeniopygia_guttata-3.2.4_genomic.fna.gz
echo "*** Downloading: $URL1"
curl -s $URL1 > srr/SRR.fa.gz
gunzip $REFSRR

URL2=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/151/805/GCA_000151805.2_Taeniopygia_guttata-3.2.4/GCA_000151805.2_Taeniopygia_guttata-3.2.4_genomic.gff.gz
echo "*** Downloading: $URL2"
curl -s $URL2 > srr/SRR.gff.gz
gunzip $GFFSRR

# Download and unpack the Long Read Reference genome

URL3=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/008/985/GCA_002008985.2_Tgut_diploid_1.0/GCA_002008985.2_Tgut_diploid_1.0_genomic.fna.gz
echo "*** Downloading: $URL3"
curl -s $URL3 > lrr/LRR.fa.gz
gunzip $REFLRR

# Build the indices
echo "*** Building hisat indices: $IDXSRR and $IDXLRR"
hisat2-build -p 14 $REFSRR $IDXSRR
hisat2-build -p 14 $REFLRR $IDXLRR
