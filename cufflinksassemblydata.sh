#


#samples for DE part of experiment
#from spleen
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001851
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001848
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001850
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001844
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001847
fastq-dump --gzip --split-files -X 10000 -O reads SRR5001846

#from brain 
fastq-dump --gzip --split-files -X 10000 -O assemblydata SRR1619467

#from muscle tissue
fastq-dump --gzip --split-files -X 10000 -O assemblydata SRR2545947

#from G226 Zebra Finch Cell Line
fastq-dump --gzip --split-files -X 10000 -O assemblydata SRR1564481

#from ZFTNA Zebra Finch Cell Line
fastq-dump --gzip --split-files -X 10000 -O assemblydata SRR1564483




