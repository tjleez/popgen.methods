#!/bin/bash

#PBS -N v16_TVMeR3ASC
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs384G
#PBS -m abe

cd $PBS_O_WORKDIR

n_threads=32
phy_alignment=/work1/tracylee77/iqtree/v16.varsites.phy
prefix=v16_phy

/home/tracylee77/bin/iqtree-1.6.12-Linux/bin/iqtree -s $phy_alignment -m TVMe+R3+ASC -nt $n_threads -bb 1000 -pre $prefix
