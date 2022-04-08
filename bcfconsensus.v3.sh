#!/bin/bash
strain=$1

cat $strain | while read -r strains;
do bcftools consensus -H 1 -s $strains \
	-f SC64-2-1.nuc.fa -M "N" \
	v16.vcf.gz -o $strains.fa
   #union -sequence $strains.fa -outseq $strains.fa
   #sed -i -r "s/chrI/$strains/" $strains.fa
done
