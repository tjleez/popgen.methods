#!/bin/bash

#PBS -N trim_Spar3
#PBS -P MST108408
#PBS -W group_list=MST108408
#PBS -q cf40
#PBS -m abe

cd $PBS_O_WORKDIR

java -jar /home/tracylee77/bin/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 16 \
SRR4074411_1.fastq.gz \
SRR4074411_2.fastq.gz \
SRR4074411_trim_R1.fastq.gz \
SRR4074411_trim_up_R1.fastq.gz \
SRR4074411_trim_R2.fastq.gz \
SRR4074411_trim_up_R2.fastq.gz \
ILLUMINACLIP:/home/tracylee77/bin/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:50
