#!/bin/bash
#PBS -N depth
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs4G
#PBS -m abe

cd $PBS_O_WORKDIR
module load biology/SAMtools/v1.9
isolate=/work1/tracylee77/syn_dip/prefix

cat $isolate | while read -r prefix;
do samtools depth -a -Q 1 $prefix.markdup.bam   |  awk '{sum+=$3} END { print sum/NR}' >$prefix.avg.depth
done
