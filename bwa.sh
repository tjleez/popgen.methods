#!/bin/bash

#PBS -N bwa
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs192G
#PBS -m abe

cd $PBS_O_WORKDIR

module load biology/SAMtools/v1.9

isolate=/work1/tracylee77/syn_dip/prefix
/home/tracylee77/bin/bwa/bwa index ref.fa -p genome

cat $isolate | while read -r prefix;
do /home/tracylee77/bin/bwa mem -t 20 -R "@RG\\tID:$prefix\\tSM:$prefix\\tPL:ILLUMINA" genome $prefix.R1.fastq.gz $prefix.R2.fastq.gz > $prefix.sam
   /home/tracylee77/bin/gatk-4.1.9.0/gatk SortSam -I $prefix.sam -O $prefix.bam -SO coordinate
   /home/tracylee77/bin/gatk-4.1.9.0/gatk CollectInsertSizeMetrics -I $prefix.bam -O insert.$prefix.txt -H insert_size_hist.$prefix.pdf
   /home/tracylee77/bin/gatk-4.1.9.0/gatk MarkDuplicates -I $prefix.bam -O $prefix.markdup.bam -M $prefix.metrics.txt
   /home/tracylee77/bin/gatk-4.1.9.0/gatk BuildBamIndex -I $prefix.markdup.bam
   samtools flagstat $prefix.markdup.bam  > $prefix.markdup.bam.flagstat
done
