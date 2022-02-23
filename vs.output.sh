#!/bin/bash

find *.vs > vs.file.list
awk 'BEGIN {print "discarded"} /discarded/ {print $5}' *.vs  | sed -r 's/.vs//g'  > discarded.sites.txt
awk -F ',' 'BEGIN {print "filename", "numNuc"} /numNuc/ {print FILENAME, $5}' *.vs | sed -r 's/ numNuc: //g' | sed -r 's/.vs//g' > numNuc.param.txt
awk 'BEGIN {print "S","Eta","Eta_E","Pi","Theta","Tajima_D","FuLi_Dstar","FuLi_Fstar"}' > vs.header.txt
cat vs.file.list | while read -r File; do  awk 'END{print $2,$3,$4,$5,$6,$7,$8,$9}' $File >>vs.lastline.txt; done
cat vs.header.txt vs.lastline.txt > tmp
paste numNuc.param.txt discarded.sites.txt tmp > vs.results.txt

