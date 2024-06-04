#! /bin/bash

set -x

### Joint Model
#### Concept loss weight = 0.001
mkdir -p Joint0.001Model/outputs
python experiments.py cub Joint --seed 1 -log_dir Joint0.001Model_Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.001 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 20 -end2end
python experiments.py cub Joint --seed 2 -log_dir Joint0.001Model_Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.001 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 20 -end2end
python experiments.py cub Joint --seed 3 -log_dir Joint0.001Model_Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.001 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 20 -end2end
python CUB/inference.py -model_dirs Joint0.001Model_Seed1/outputs/best_model_1.pth Joint0.001Model_Seed2/outputs/best_model_2.pth Joint0.001Model_Seed3/outputs/best_model_3.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -log_dir Joint0.001Model/outputs
#### Concept loss weight = 0.01
mkdir -p Joint0.01Model/outputs
python experiments.py cub Joint --seed 1 -log_dir Joint0.01Model__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end
python experiments.py cub Joint --seed 2 -log_dir Joint0.01Model__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end
python experiments.py cub Joint --seed 3 -log_dir Joint0.01Model_Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
python CUB/inference.py -model_dirs Joint0.01Model__Seed1/outputs/best_model_1.pth Joint0.01Model__Seed2/outputs/best_model_2.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -feature_group_results -log_dir Joint0.01Model/outputs
# #### Concept loss weight = 0.01, with Sigmoid
# python experiments.py cub Joint --seed 1 -log_dir Joint0.01SigmoidModel__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid
# python experiments.py cub Joint --seed 2 -log_dir Joint0.01SigmoidModel__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid
# python experiments.py cub Joint --seed 3 -log_dir Joint0.01SigmoidModel__Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.01 -normalize_loss -b 64 -weight_decay 0.0004 -lr 0.001 -scheduler_step 1000 -end2end -use_sigmoid
# #### Concept loss weight = 0.1
# python experiments.py cub Joint --seed 1 -log_dir Joint0.1Model__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python experiments.py cub Joint --seed 2 -log_dir Joint0.1Model__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python experiments.py cub Joint --seed 3 -log_dir Joint0.1Model__Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 0.1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python CUB/inference.py -model_dirs Joint0.1Model__Seed1/outputs/best_model_1.pth Joint0.1Model__Seed2/outputs/best_model_2.pth Joint0.1Model__Seed3/outputs/best_model_3.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -log_dir Joint0.1Model/outputs
# #### Concept loss weight = 1
# python experiments.py cub Joint --seed 1 -log_dir Joint1Model__Seed1/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python experiments.py cub Joint --seed 2 -log_dir Joint1Model__Seed2/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python experiments.py cub Joint --seed 3 -log_dir Joint1Model__Seed3/outputs/ -e 1000 -optimizer sgd -pretrained -use_aux -use_attr -weighted_loss multiple -data_dir CUB/CUB_processed -n_attributes 112 -attr_loss_weight 1 -normalize_loss -b 64 -weight_decay 0.00004 -lr 0.01 -scheduler_step 1000 -end2end
# python CUB/inference.py -model_dirs Joint1Model__Seed1/outputs/best_model_1.pth Joint1Model__Seed2/outputs/best_model_2.pth Joint1Model__Seed3/outputs/best_model_3.pth -eval_data test -use_attr -n_attributes 112 -data_dir CUB/CUB_processed -log_dir Joint1Model/outputs
