#!/bin/bash

wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.0-Linux-x86_64.sh
export PATH="~$USER/Anaconda3/bin:$PATH"
conda create --name jupyterhub27 python=2.7
source activate jupyterhub27
# If you don't want to install the environment uncomment
#conda install -c conda-forge jupyterlab
#conda install -c conda-forge jupyterhub
