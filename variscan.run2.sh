#!/bin/bash

numnuc_list=$1

cat $numnuc_list | while read -r pop conf; do

	/home/tjl/bin/variscan-2.0.3/src/variscan $pop.phy $conf > $pop.vs
done
