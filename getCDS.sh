#!/bin/bash
prefix_list=$1  # a list of prefix to fa files, one per line

cat $prefix_list | while read -r prefix;
do bedtools getfasta -fi $prefix.fa -bed ref.bed -split -s -nameOnly -fo $prefix.CDS.fa
    sed -i -r "s/\(\+\)//" $prefix.CDS.fa
    sed -i -r "s/\(\-\)//" $prefix.CDS.fa
done
