#!/bin/bash
List=$1

cat $List | while read -r prefix;
do java -jar /home/ijt/bin/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 16 \
$prefix.R1.fastq.gz \
$prefix.R2.fastq.gz \
$prefix\_trim_R1.fastq.gz \
$prefix\_trim_up_R1.fastq.gz \
$prefix\_trim_R2.fastq.gz \
$prefix\_trim_up_R2.fastq.gz \
ILLUMINACLIP:/home/ijt/bin/Trimmomatic-0.36/adapters/NexteraPE-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:100
done
