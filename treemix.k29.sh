#!/bin/bash

#PBS -N K29
#PBS -P MST109178
#PBS -W group_list=MST109178
#PBS -q ngs192G
#PBS -m abe

cd $PBS_O_WORKDIR

for m in 1 2 3 4 5 6 7 8 9 10
do
	for i in 1 2 3 4 5
		do /home/tracylee77/bin/treemix-1.13/src/treemix -i plink.treemix.frq.gz -m $m -o k29.$i.$m -global -bootstrap -k 1000 -root TW1
		done
done
