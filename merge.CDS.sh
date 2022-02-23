#!/bin/bash

gene_list=$1  #list of gene ID, one per line
prefix_list=$2  #list of isolate ID, one per line
outDir=$3  #output directory

while read -r geneID ID; do
	echo $geneID > tmp1
	while read -r prefix lineage; do
		seqtk subseq $prefix.CDS.fa tmp1 | sed -r 's/>.*/>'$prefix'/' >> $outDir/$ID.fa
	done < $prefix_list
done < $gene_list
