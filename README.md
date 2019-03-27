<div align="center">
<a href="https://www.cemac.leeds.ac.uk/">
  <img src="https://github.com/cemac/cemac_generic/blob/master/Images/cemac.png"></a>
  <br>
</div>

# CEMAC FORK OF MIKE CROUCHERS JUPYERHUB ON AZURE
 

[![GitHub release](https://img.shields.io/github/release/cemac/jupyterhub_on_azure.svg)](https://github.com/cemac/jupyterhub_on_azure/releases) [![GitHub top language](https://img.shields.io/github/languages/top/cemac/jupyterhub_on_azure.svg)](https://github.com/cemac/jupyterhub_on_azure) [![GitHub issues](https://img.shields.io/github/issues/cemac/jupyterhub_on_azure.svg)](https://github.com/cemac/jupyterhub_on_azure/issues) [![GitHub last commit](https://img.shields.io/github/last-commit/cemac/jupyterhub_on_azure.svg)](https://github.com/cemac/jupyterhub_on_azure/commits/master) [![GitHub All Releases](https://img.shields.io/github/downloads/cemac/jupyterhub_on_azure/total.svg)](https://github.com/cemac/jupyterhub_on_azure/releases)

 :construction: MAJOR OVERHAUL OF DOCUMENTATION IN PROGRESS


This repository contains scripts for automatic creation of customised JupyterHub instances running on Azure cloud designed for multi-user classes.

```diff
- NB: This is designed to work following Leeds Uni Practice
- Central IT control the Azure account and must set up VM (Jan 2019)
```

# Version 2.0 #

Following on from Mike Croucher's jupyterhub_on_azure setup, Version builds on documentation and functionality.

## Features ##

* Set up JupyterHub on Azure Ubuntu LTS machine
* Server settings
* Anaconda Installation
* Jupyter hub configuration
* Certificate generation
* Legacy VM creation scripts

## Requirements

* Azure VM, IP address and Admin ID to access (via IT following [create_vm](create_vm))
* UBUNTU 18.04 LTS (*recommended*)

## Installation/ Usage (recommended method)

* ssh to Azure machine `ssh -Y <adim_ID>@<VM_IP>`
* `git clone https://github.com/cemac/jupyterhub_on_azure.git`
* Follow [ubuntu_setup](./ubuntu_setup) to set up server and users
* Follow [python_setup](./python_setup) to set up python environment
* Follow [jupyterhub_setup](./jupyterhub_setup) to set up Jupyter Hub

*NB previously this set up was done using mike's create_vm scripts, however this
is now managed by Leeds central IT - the scripts are preserved for reference in [create_vm](create_vm)*

## Tips ##


## COLLABORATING

Collaboration is very welcome and encouraged.
* A full guide on submitting issue and bug are given in our [contribution guidelines](https://github.com/cemac/jupyterhub_on_azure/blob/master/CONTRIBUTING.md)
* Please use our issue templates for feature requests and bug fixes.

<hr>

## FUTURE ##

This project will move to a containerised set up in the future in a new JupyterHubLeeds
project for academic year 2019/2020.

<hr>

## ACKNOWLEGEMENTS

Thanks to Mike Croucher for Setting this up.

## LICENSE

This project is currently licensed under the [MIT license](https://choosealicense.com/licenses/mit/).
