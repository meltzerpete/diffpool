#!/usr/bin/env bash

#for DATASET in MUTAG PTC_FM NCI1 ; do
#for DATASET in NCI1 ; do
for DATASET in ISOMORPHISM ; do
#    for ASSIGN in 0.1 0.2 0.3 ; do
    for ASSIGN in 0.3 ; do
        for H1 in 30 40 50 ; do
            for H2 in 30 40 50 ; do
                echo ${DATASET} ${ASSIGN} ${H1} ${H2}
                python -m train \
                    --bmname=${DATASET} \
                    --train-ratio=0.9 \
                    --assign-ratio=${ASSIGN} \
                    --hidden-dim=${H1} \
                    --output-dim=${H2} \
                    --cuda=0 \
                    --num-classes=2 \
                    --method=soft-assign > ${DATASET}-${ASSIGN}-${H1}-${H2}.log
            done
        done
    done
done
