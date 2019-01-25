#!/bin/bash
##################################
#                                #
#       Setting Up Python        #
#                                #
##################################
#
#  CEMAC (UoL) 2019
#
#
# Clone this repo if you haven't already
# git clone https://github.com/cemac/jupyterhub_on_azure.git
# ----------------------------------------------------
# Section 1 - Install anaconda to the system
# ----------------------------------------------------
# Update
# Download latest anaconda
cd /tmp
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
# Create an installation location
sudo bash Anaconda3-5.3.1-Linux-x86_64.sh
# set installation location as /opt/anaconda3
sudo chmod ugo+w /opt/anaconda3
sudo chmod -R g+w /opt/anaconda3/
sudo chown -R root:jupyteradmin /opt/anaconda3
# ----------------------------------------------------
# Section 2 - Install bas jupyterhub environment
# ----------------------------------------------------
#
# OPTION #1 use default environment
#
conda env create -f environment.yml
#
# OPTION #2 Mannually install
#
conda install -c conda-forge jupyterhub
conda install cartopy
conda install cython
conda install netCDF4
conda install -c conda-forge nodejs
conda install nodejs
conda install -c conda-forge nbgrader
conda install -c anaconda-nb-extensions nb_conda
# Dump package list so you can replicate this environment in the future
conda list -e > requirements.txt
conda env export | grep -v "^prefix: " > environment.yml
conda clean -t
