#! /bin/bash

set -x

#### Concept loss weight = 0.01
python experiments.py cub Joint --seed 1 -ckpt 1 -log_dir Joint0.01Model__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end
python experiments.py cub Joint --seed 2 -ckpt 1 -log_dir Joint0.01Model__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end
python experiments.py cub Joint --seed 3 -ckpt 1 -log_dir Joint0.01Model_Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
python CUB/inference.py -model_dirs Joint0.01Model__Seed1/outputs/best_model_1.pth Joint0.01Model__Seed2/outputs/best_model_2.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -feature_group_results -log_dir Joint0.01Model/outputs