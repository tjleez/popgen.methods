#!/bin/bash
strain=$1

cat $strain | while read -r strains;
do bcftools consensus -I -s $strains \
	-f SC64-2-1.nuc.fa -M "N" \
	v16.vcf.gz -o $strains.fa
  #union -sequence $strains.fa -outseq ./full.Length/$strains.fa
  #sed -i -r "s/chrI/$strains/" ./full.Length/$strains.fa
done
