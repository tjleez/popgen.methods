#!/bin/bash

gatk SplitVcfs -I N340.bcftools.vcf.gz -SNP_OUTPUT v8.vcf.gz -INDEL_OUTPUT v8_indel.vcf.gz -STRICT false
bcftools filter -i 'QUAL>30 & MQ>30' -Oz -o v9.vcf.gz v8.vcf.gz
vcftools --gzvcf v9.vcf.gz  --max-missing 0.5 --non-ref-ac-any 2 --recode --recode-INFO-all --out v10
vcftools --vcf v10.vcf --minDP 3 --recode --recode-INFO-all --out v10.1

gatk SplitVcfs -I N340.freebayes.vcf.gz -SNP_OUTPUT v12.vcf.gz -INDEL_OUTPUT v12_indel.vcf.gz -STRICT false
vcftools --gzvcf v12.vcf.gz  --max-missing 0.5 --non-ref-ac-any 2 --minQ 30 --recode --recode-INFO-all --out v13
vcftools --vcf v13.vcf --minDP 3 --recode --recode-INFO-all --out v13.1
bcftools filter -i 'AB > 0.25 & AB < 0.75 | AB < 0.01' -Ov -o v13.2.vcf v13.1.vcf
bcftools filter -i 'MQM / MQMR > 0.9 & MQM / MQMR < 1.05' -Ov -o v13.3.vcf v13.2.vcf
bcftools query -f "%CHROM\t%POS\t%INFO/DP\n" v13.3.vcf > v13.3.INFO.DP.txt
