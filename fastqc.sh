#!/bin/bash

List=$1
Dir=$2

cat $List | while read path;
do fastqc $path -o $Dir
done
