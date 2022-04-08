#!/bin/bash

# #PBS -P MST108408
# #PBS -l select=1:ncpus=8
# #PBS -q cf40
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs8G
#PBS -N freebayes_batch
# #PBS -J 1-248

set -e
cd $PBS_O_WORKDIR

region_file=ref.fa.regions.50k.txt
region=`sed -n ${PBS_ARRAY_INDEX}p $region_file`
printf -v pad_idx "%06d" $PBS_ARRAY_INDEX

module load anaconda3/5.1.10
source activate /home/hsinhan97/miniconda3/envs/freebayes132

>&2 echo -e "${PBS_ARRAY_INDEX}\t${region}"

freebayes --region $region -v tmp.${pad_idx}.vcf \
    -f ref.fa -L bam.path --use-best-n-alleles 6
    # || echo "$region" >> fail.txt
bgzip tmp.${pad_idx}.vcf
tabix tmp.${pad_idx}.vcf.gz
