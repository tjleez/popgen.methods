#!/bin/bash

while read -r geneID ID; do
/home/tjl/variant_analysis/pal2nal.pl ./fastas.aa/$geneID.fa ./fastas/$geneID.fa -output fasta -nogap > ./pal2nal/$ID.pal2nal
done < /home/tjl/variant_analysis/pal2nal.list
