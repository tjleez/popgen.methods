#!/bin/bash

#PBS -N mpileup
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs192G
#PBS -m abe

cd $PBS_O_WORKDIR
Chrname=/work1/tracylee77/syn_dip/chromosomes

cat $Chrname | while read -r Chr;
do /home/tracylee77/bin/bcftools/bcftools mpileup -b bam.list -r $Chr -Ou -o $Chr.bcf -f ref.fa -d 1332 -a AD,ADF,ADR,DP,SP,INFO/AD,INFO/ADF,INFO/ADR
done

