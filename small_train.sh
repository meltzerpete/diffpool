#!/usr/bin/env bash

mkdir -p small_train

#for DATASET in MUTAG PTC_FM NCI1 ; do
for DATASET in PTC_FM PTC_FR PTC_MM PTC_MR ; do
#for DATASET in NCI1 ; do
#for DATASET in PROTEINS ; do
    for ASSIGN in 0.1 0.2 0.3 ; do
        for H1 in 30 40 50; do
            for H2 in 30 40 50 ; do
                for NUM_TRAIN in 10 20 30 40 50 60 ; do
                    echo ${DATASET} ${ASSIGN} ${H1} ${H2}
                    python -m train \
                        --bmname=${DATASET} \
                        --num-train=${NUM_TRAIN} \
                        --assign-ratio=${ASSIGN} \
                        --hidden-dim=${H1} \
                        --output-dim=${H2} \
                        --cuda=0 \
                        --num-classes=2 \
                        --method=soft-assign > small_train/${DATASET}-${ASSIGN}-${H1}-${H2}-${NUM_TRAIN}.log
                done
            done
        done
    done
done
