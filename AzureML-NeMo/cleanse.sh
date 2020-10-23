#!/bin/bash
clear

MYPWD=${PWD}
echo $MYPWD

ls

rm -rfv DATA_DIR
rm -rfv mlruns
rm -rfv wandb
rm -rfv glue_data
rm -rfv NeMo
rm -rfv NeMo_
rm -rfv NeMo_v1.0.0b1
rm -rfv nemo_experiments
rm -rfv WORK_DIR
rm -rfv glue_benchmark.log
rm -rfv token_classification.log
rm -rfv .ipynb_checkpoints
rm -rfv .hydra


echo "----------- cleansing_complete-----------"
ls