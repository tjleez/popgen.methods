#!/bin/bash

while read -r pop; do
	while read -r Chr; do
		vcftools --vcf phy2.input.vcf --keep $pop --chr $Chr --ldhat-geno --out $pop.$Chr
	done < chromosomes
done < populations
