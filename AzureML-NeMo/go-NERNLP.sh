#!/bin/bash
# scrip that runs the NER NLP task from the nemo container

# clear

# enables full trace hydra debugging 
export HYDRA_FULL_ERROR=1
echo HYDRA_FULL_ERROR $HYDRA_FULL_ERROR

# nvidia gpu stats 
nvidia-smi

cd /workspace #/nemo
echo "----------- work space is -----------"
pwd
echo "----------- files in work space are -----------"
ls
echo "----------- go-NERNLP -----------"

version=$1
echo "version" $version

# NER NLP python and hyperparameters 
python $version/examples/nlp/token_classification/token_classification.py \
model.language_model.pretrained_model_name="distilbert-base-cased"  \
model.dataset.data_dir=/workspace/DATA_DIR/NER \
model.dataset.num_workers=4 \
trainer.gpus=1 \
trainer.amp_level=O1 \
trainer.max_epochs=1 \
model.train_ds.batch_size=64 \
model.validation_ds.batch_size=8 \
exp_manager.create_checkpoint_callback=False

# alternate models and saves to use 
# model.nemo_path=/workspace/nemo/examples/nlp/token_classification/nemo_model \
# model.language_model.pretrained_model_name="biomegatron-bert-345m-cased"  \
# model.language_model.pretrained_model_name="distilbert-base-cased"  \
# model.nemo_path=/workspace/nemo/nemo_exp.nemo \
# trainer.distributed_backend=ddp \
