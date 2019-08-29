#!/usr/bin/env bash

out_dir=isomorphism
mkdir -p ${out_dir}

for DATASET in ISOMORPHISM ; do
    for ASSIGN in 0.3 ; do
        for NUM_TRAIN in 10 20 30 40 50 60 70 80 90 100 ; do
            echo ${DATASET} ${ASSIGN}
            python -m train \
                --bmname=${DATASET} \
                --assign-ratio=${ASSIGN} \
                --num-train=${NUM_TRAIN} \
                --cuda=0 \
                --num-classes=5 \
                --method=soft-assign > ${out_dir}/${DATASET}-${ASSIGN}-${NUM_TRAIN}.log
        done
    done
done
