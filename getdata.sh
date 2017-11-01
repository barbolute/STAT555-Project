# A script that fully automates the RNA-seq analysis of the samples in this study.
#

# Stop on any error.
set -ueo pipefail

# This is the reference genome.
REFSRR=srr/SRR.fa*
REFLRR=lrr/LRR.fa*

# The names for the index.
IDXSRR=SRR.fa
IDXLRR=LRR.fa

# The files containint genomic coordinate.
GFFSRR=srr/SRR.gff*
GFFLRR=lrr/LRR.gff*

fastq-dump --gzip --split-files -X 10000 -O reads SRR5001851
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001848
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001850
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001844
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001847
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001846

# Download and unpack the data
URL1=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/151/805/GCA_000151805.2_Taeniopygia_guttata-3.2.4/GCA_000151805.2_Taeniopygia_guttata-3.2.4_genomic.fna.gz
echo "*** Downloading: $URL1"
curl -s $URL1 > srr/SRR.fa.gz
gunzip $REFSRR

URL2=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/151/805/GCA_000151805.2_Taeniopygia_guttata-3.2.4/GCA_000151805.2_Taeniopygia_guttata-3.2.4_genomic.gff.gz
echo "*** Downloading: $URL2"
curl -s $URL2 > srr/SRR.gff.gz
gunzip $GFFSRR

URL3=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/008/985/GCA_002008985.2_Tgut_diploid_1.0/GCA_002008985.2_Tgut_diploid_1.0_genomic.fna.gz
echo "*** Downloading: $URL3"
curl -s $URL3 > lrr/LRR.fa.gz
gunzip $REFLRR

URL4=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/002/008/985/GCA_002008985.2_Tgut_diploid_1.0/GCA_002008985.2_Tgut_diploid_1.0_genomic.gff.gz
echo "*** Downloading: $URL4"
curl $URL4 > lrr/LRR.gff.gz
gunzip $GFFLRR




# Build the indices
echo "*** Building hisat indices: $IDX_ERCC and $IDX_HUMAN"
hisat2-build $REF_ERCC $IDX_ERCC 1>runlog.txt 2> runlog.txt
hisat2-build $REF_HUMAN $IDX_HUMAN 1>>runlog.txt 2>> runlog.txt
