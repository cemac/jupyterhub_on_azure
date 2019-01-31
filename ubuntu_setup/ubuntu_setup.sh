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
sudo ufw allow 443
sudo ufw allow 8000
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
# Install apg for password generation
sudo apt-get -y install apg
# Makesure git script is executable
chmod 755 gen_users.sh
# run script with sudo privileges
# Edit if want names tied to sepcific course e.g. coursename_user_1
sudo groupadd -g 1160 jupyterhub
sudo ./gen_users.sh
# You will now have a file ~/users.txt with a set of users and passwords
# ls /home/ will display all users
# --------------------------------------------------
# Section 3 - Back Up
# --------------------------------------------------
#
# IT will mount datadrive and back to the VM at /storage/xxxx
# Install rsnapshot to do the backups
sudo apt-get -y install rsnapshot
# Snapshot_root location
sudo sed -i s,/var/cache/rsnapshot/,/storage/backup/,g /etc/rsnapshot.conf
# Permission default to root access
sudo chown -R jupyteradmin:jupyteradmin /storage/backup/
sudo rsnapshot -t alpha
sudo rsnapshot help
sudo chgrp geosciences_instructor /storage/earth_data/
sudo chmod g+rwx /storage/earth_data/
sudo emacs -nw /etc/rsnapshot.conf
chmod g+rw earth_data/
history > history.txt
# We don't want to back up /etc and /usr/local so comment these lines out
sudo sed -i 's,backup\t/etc,#backup\t/etc,g' /etc/rsnapshot.conf
sudo sed -i 's,backup\t/usr/local,#backup /usr/local,g' /etc/rsnapshot.conf
# test config
sudo rsnapshot configtest
sudo rsnapshot -t alpha
# Activate the cron job by uncommenting the relevant lines
sudo sed -i '/alpha/s/^#//g' /etc/cron.d/rsnapshot
sudo sed -i '/beta/s/^#//g' /etc/cron.d/rsnapshot
sudo sed -i '/gamma/s/^#//g' /etc/cron.d/rsnapshot
