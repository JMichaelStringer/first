#!/bin/bash
# launches the latest stable nemo containers as of (10-22-2020) 
# starts the NER NLP python run script in the container

clear

MYPWD=${PWD}
echo $MYPWD

version='NeMo_v1.0.0b1'

# uses the base nemo container which uses pytorch container nvcr.io/nvidia/pytorch:20.08-py3 base
docker pull nvcr.io/nvidia/nemo:v1.0.0b1

docker run --gpus all -it --rm -v $MYPWD:/workspace --shm-size=8g \
--ulimit memlock=-1 --ulimit \
stack=67108864 nvcr.io/nvidia/nemo:v1.0.0b1 /workspace/go-NERNLP.sh $version
