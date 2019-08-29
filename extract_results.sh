#!/usr/bin/env bash

input_dir=$1
mkdir -p csv

for file in `ls ${input_dir}` ; do
    csv="${file%.*}".csv
    echo trial epoch accuracy > csv/${csv}
    awk 'BEGIN {t=-1; e=0} /Epoch:  0/ {t=t+1; e=-1;} /Epoch/ {e=e+1} /Validation  accuracy/ {print(t, e, $3)}' ${input_dir}/${file} >> csv/${csv}
done


