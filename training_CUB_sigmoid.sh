#!/bin/bash

mkdir -p Joint0.01SigmoidModel/outputs

python experiments.py cub Joint --seed 1 -log_dir Joint0.01SigmoidModel__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid
python experiments.py cub Joint --seed 2 -log_dir Joint0.01SigmoidModel__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid
python experiments.py cub Joint --seed 3 -log_dir Joint0.01SigmoidModel__Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid

python CUB/inference.py -model_dirs Joint0.01SigmoidModel__Seed1/outputs/best_model_1.pth Joint0.01SigmoidModel__Seed2/outputs/best_model_2.pth Joint0.01SigmoidModel__Seed3/outputs/best_model_3.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -feature_group_results -log_dir Joint0.01SigmoidModel/outputs

mkdir TTI__Joint0.01SigmoidModel
python3 CUB/tti.py -model_dirs Joint0.01SigmoidModel__Seed1/outputs/best_model_1.pth Joint0.01SigmoidModel__Seed2/outputs/best_model_2.pth Joint0.01SigmoidModel__Seed3/outputs/best_model_3.pth -use_attr -mode random -n_trials 5 -use_invisible -class_level -data_dir2 CUB/CUB_processed -data_dir CUB/CUB_processed -log_dir TTI__Joint0.01Model  -use_sigmoid
