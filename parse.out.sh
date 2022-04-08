#!/bin/bash
prefix=$1

while read -r ID;
do python parse_codeml_output_python3.v2.py ./dnds/$ID.out | tail -n 1 | awk -v var="$ID" '{print $0 "\t"var}' >> $prefix.out
done < ID.list
