#!/bin/bash

#PBS -N v16_div
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs8G
#PBS -m abe

cd $PBS_O_WORKDIR

python /work1/tracylee77/pairwise_div/pair_div_from_vcf.fa.py v16.vcf.fa 340isolates v16.N340.div.txt

