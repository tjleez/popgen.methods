#!/bin/bash

#PBS -N admix0
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs192G
#PBS -m abe

cd $PBS_O_WORKDIR

plink --vcf v16r.vcf --make-bed --recode --set-missing-var-ids @:#:\$1,\$2 --allow-extra-chr --out v16
plink --bfile v16 --indep-pairwise 50 10 0.5 --r2 --allow-extra-chr --out pruning
plink --bfile v16 --extract pruning.prune.in --make-bed --recode --allow-extra-chr --out trimmed

