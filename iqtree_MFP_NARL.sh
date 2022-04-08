#!/bin/bash

#PBS -N v16_ModelFinder
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs384G
#PBS -m abe

cd $PBS_O_WORKDIR

n_threads=32
fasta_alignment=/work1/tracylee77/iqtree/v16.vcf.fa
prefix=v16_fa

/home/tracylee77/bin/iqtree-1.6.12-Linux/bin/iqtree -s $fasta_alignment -m MF -nt $n_threads -pre $prefix
