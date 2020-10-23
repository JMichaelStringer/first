#!/bin/bash
# launches the latest pytorch containers as of (10-22-2020) 
# starts the install script in the container
# may require fixing, use bash launch-nemo-glue.sh and bash launch-nemo-ner.sh for stable versions

clear

MYPWD=${PWD}
echo $MYPWD

# uses the base pytorch container 
docker pull nvcr.io/nvidia/pytorch:20.09-py3

docker run --gpus all -it --rm -v $MYPWD:/workspace --shm-size=8g \
--ulimit memlock=-1 --ulimit \
stack=67108864 nvcr.io/nvidia/pytorch:20.09-py3 /workspace/containersetup.sh
