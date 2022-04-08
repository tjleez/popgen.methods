#!/bin/bash

#PBS -N admix1
#PBS -P MST108408
#PBS -W group_list=MST108408
#PBS -q cf40
#PBS -m abe

cd $PBS_O_WORKDIR


for k in {2..30};
do 
	admixture -s time --cv trimmed.bed $k -j16  | tee trimmed.log$k.out
done

