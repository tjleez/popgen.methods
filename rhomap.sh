#!/bin/bash


while read -r pop table; do
	while read -r Chr; do
	/home/tjl/bin/LDhat/rhomap -seq $pop.$Chr.ldhat.sites -loc $pop.$Chr.ldhat.locs -lk $table -its 10000 -samp 100 -burn 100 -prefix $pop.$Chr.
	done < chromosomes
done < pop.lookup3
