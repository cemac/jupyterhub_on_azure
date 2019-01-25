#!/bin/bash
##################################
#                                #
#    Setting Up Ubuntu Server    #
#                                #
##################################
#
#  CEMAC (UoL) 2019
#
#
# Clone this repo
# git clone https://github.com/cemac/jupyterhub_on_azure.git
# ----------------------------------------------------
# Section 1 - Secrutity and intial setup
# ----------------------------------------------------
# Update
sudo apt-get update
sudo apt-get upgrade
# Set up firewall and allow traffic
sudo ufw status
sudo ufw allow 22
sudo ufw allow ssh
sudo ufw allow OpenSSH
# Now enable the firewall, a warning will appear
# having allowed 22 and ssh connections your ssh
# connection will not be interupted
sudo ufw enable
sudo ufw status
# install favourite editor
sudo apt install emacs25
# update .bashrc with aliases etc
# cp -p -p jupyterhub_on_azure/ubuntu_setup/.bashrc ~/
# source .bashrc
# If using emacs get rid of constant buffers
cp -p jupyterhub_on_azure/ubuntu_setup/init.el ~/.emacs.d
# ---------------------------------------------------
# Section 1b - optional Azure CLI
# ---------------------------------------------------
# Mike suggests installing Azure CLI
# Install Azure CLI
# UBUNTU release e.g bionic
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
# The above commands install Azure CLI - However CEMAC doesn't have access to
# azure account...
# --------------------------------------------------
# Section 2 - Setting up users
# --------------------------------------------------
# By default, users can read the files in each other's home directory.
# Change this so only sudo users have this ability
sudo sed -i s/DIR_MODE=0755/DIR_MODE=0750/g /etc/adduser.conf
#
#
