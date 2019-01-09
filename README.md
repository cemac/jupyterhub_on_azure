<div align="center">
<a href="https://www.cemac.leeds.ac.uk/">
  <img src="https://github.com/cemac/cemac_generic/blob/master/Images/cemac.png"></a>
  <br>
</div>

# CEMAC FORK OF MIKE CROUCHERS JUPYERHUB ON AZURE

This repository contains scripts for automatic creation of customised JupyterHub instances running on Azure cloud designed for multi-user classes. 

## Setting Up a new server

* Install Azure CLI or access the Cloud shell from https://portal.azure.com/
* Clone this repository, modify and run `create_vm.sh` from your local machine.  This creates the Azure VM
* Log into the created Azure VM, clone this repo and run `install.sh`

## Useful sysadmin notes when using the resulting server

### Adding accounts to sudoers list

When running your course, you may have classroom assistants or other trusted users who you may want to give full sudo access to.
To add `training_user2` to the sudoers list for example:

```
sudo usermod -aG sudo training_user2
```

You'll get the following error messages
```
sent invalidate(passwd) request, exiting
sent invalidate(group) request, exiting
sent invalidate(passwd) request, exiting
sent invalidate(group) request, exiting
```

These are nothing to worry about

### Stopping and starting the JupyterHub service

The JupyterHub service can be stopped, started etc with the following commands

```
sudo systemctl daemon-reload
sudo systemctl start jupyterhub
sudo systemctl stop jupyterhub
sudo systemctl restart jupyterhub
sudo systemctl status jupyterhub
```

## FUTURE

* 2019/2020 Move to containerised Kubrenetes server (JupyterHubLeeds Repository for development *requests may be made to collaborate on this project*)

## COLLABORATING

Collaboration is very welcome and encouraged. *Collaborating Guidelines Comming soon*

## ACKNOWLEGEMENTS

Thanks to Mike Croucher for Setting this up.

## LICENSE 

*coming soon* 
