#!/bin/bash
ID_list=$1

cat $ID_list | while read -r geneID ID;
do
    cat ./pal2nal/$ID.pal2nal > pal2nal.txt
    codeml
    cat codeml.txt > ./dnds/$ID.out
done
