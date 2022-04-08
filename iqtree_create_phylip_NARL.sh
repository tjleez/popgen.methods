#!/bin/bash

#PBS -N v16_create_phy
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs96G
#PBS -m abe

cd $PBS_O_WORKDIR

n_threads=16
fasta_alignment=/work1/tracylee77/iqtree/v16.vcf.fa
prefix=v16

/home/tracylee77/bin/iqtree-1.6.12-Linux/bin/iqtree -s $fasta_alignment -m GTR+ASC -nt $n_threads -pre $prefix
