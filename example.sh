#!/usr/bin/env bash

source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate ml

# ENZYMES
#python -m train --datadir=data --bmname=ENZYMES --cuda=3 --max-nodes=100 --num-classes=6

# ENZYMES - Diffpool
python -m train --bmname=ENZYMES --assign-ratio=0.1 --hidden-dim=30 --output-dim=30 --cuda=0 --num-classes=6 --method=soft-assign

# DD
#python -m train --datadir=data --bmname=DD --cuda=0 --max-nodes=500 --epochs=1000 --num-classes=2

# DD - Diffpool
python -m train --bmname=ENZYMES --assign-ratio=0.1 --hidden-dim=64 --output-dim=64 --cuda=0 --num-classes=2 --method=soft-assign
