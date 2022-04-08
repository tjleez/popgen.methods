#!/bin/bash


while read -r pop table; do
	while read -r Chr; do
		awk '{sum+=$3} END { print sum/NR}' $pop.$Chr.summary.txt >> $pop.meanRho.txt
	done < chromosomes
done < pop.lookup3
