#!/bin/bash

datasets=("PandaLM")

for dataset in ${datasets[@]}
do
    mkdir -p results/plots/${dataset}-bayds
    mkdir -p results/logs/${dataset}-bayds
    python main.py --estimator None \
                    --dataset ${dataset} \
                    --calibrator BayesianDawidSkene \
                    --compare_models llama-7b___All \
                    --plot_dir results/plots/${dataset}-bayds/no_prior |& tee results/logs/${dataset}-bayds/no_prior.log
done
