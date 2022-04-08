#!/bin/bash

#PBS -N bcfcall
#PBS -P MST108408
#PBS -W group_list=MST108408
#PBS -q cf40
#PBS -m abe

cd $PBS_O_WORKDIR
#Chrname=/work1/tracylee77/syn_dip/chromosomes
Chrname=/work1/tracylee77/Spar1/chromosomes

cat $Chrname | while read -r Chr;
do /home/tracylee77/bin/bcftools/bcftools call -mv -Oz -o $Chr.vcf.gz $Chr.bcf
done

/home/tracylee77/bin/bcftools/bcftools concat -f vcf.list -Oz -o sp0.vcf.gz
