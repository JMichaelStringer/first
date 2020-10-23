#!/bin/bash
# script to set up the conatiner with nemo 
# and launch either training script

# cd /workspace/nemo

version='NeMo'

pip install Cython
python -m pip install git+https://github.com/NVIDIA/NeMo.git@main#egg=nemo_toolkit[all]
pip install ipywidgets
# jupyter nbextension enable --py widgetsnbextension

# go-NERNLP.sh is for ner nlp 
bash go-NERNLP.sh $version

# go-gluetask.sh is for glue task 
bash go-gluetask.sh $version

echo "----------- done -----------"

# use to pull the latest version on main NeMo and install
# python -m pip install git+https://github.com/NVIDIA/NeMo.git@main#egg=nemo_toolkit[all]

# use to pull the stabel version in the notebook setup
# python -m pip install git+https://github.com/NVIDIA/NeMo.git@4e4597a85d80c77603102603e35fb033ba852c64#egg=nemo_toolkit[all]

# apex is already installed in the pytorch container
# git clone https://github.com/NVIDIA/apex
# cd apex
# pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./


# use this to make a new nemo only enviorment ( not working )
# conda env remove --name nemo
# conda create --name nemo -y
# conda activate nemo
# conda install pip -y
# conda install ipykernel -y 
# python -m ipykernel install --user --name nemo --display-name "Python (nemo)"
# conda install pytorch torchvision cudatoolkit=10.2 -c pytorch -y 
# pip install Cython
# python -m pip install --upgrade git+https://github.com/NVIDIA/NeMo.git#egg=nemo_toolkit[nlp]
# pip install ipywidgets
# jupyter nbextension enable --py widgetsnbextension
