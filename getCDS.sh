#!/bin/bash
prefix_list=$1
cat $prefix_list | while read -r prefix;
do bedtools getfasta -fi $prefix.fa -bed sorted.noMito.bed -split -s -nameOnly -fo $prefix.CDS.fa
    sed -i -r "s/\(\+\)//" $prefix.CDS.fa
    sed -i -r "s/\(\-\)//" $prefix.CDS.fa
done
