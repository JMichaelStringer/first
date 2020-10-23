#!/bin/bash
# scrip that runs the glue benchmark from the nemo container

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
echo "----------- go-gluetask -----------"

version=$1
echo "version" $version

# glue python and hyperparameters 
python $version/examples/nlp/glue_benchmark/glue_benchmark.py \
model.language_model.pretrained_model_name="albert-base-v1"  \
model.dataset.data_dir=/workspace/DATA_DIR/glue_data/SST-2 \
model.dataset.num_workers=4 \
model.task_name=sst-2 \
trainer.gpus=1 \
trainer.amp_level=O1 \
trainer.max_epochs=1 \
model.train_ds.batch_size=128 \
model.validation_ds.batch_size=14 \
exp_manager.create_checkpoint_callback=False


# alternate models to use 
# model.language_model.pretrained_model_name="distilbert-base-cased"  \
# trainer.distributed_backend=ddp \
