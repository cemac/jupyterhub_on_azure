<div align="center">
<a href="https://www.cemac.leeds.ac.uk/">
  <img src="https://github.com/cemac/cemac_generic/blob/master/Images/cemac.png"></a>
  <br>
</div>

# CEMAC FORK OF MIKE CROUCHERS JUPYERHUB ON AZURE


[![GitHub release](https://img.shields.io/badge/release-v.2.0-blue.svg)](
https://github.com/cemac/jupyterhub_on_azure/releases/tag/2.0)

This repository contains scripts for automatic creation of customised JupyterHub instances running on Azure cloud designed for multi-user classes.

```diff
- NB: This is designed to work following Leeds Uni Practice
- Central IT control the Azure account and must set up VM (Jan 2019)
```
# Version 2.0 #

Following on from Mike crouchers's original version.

## Features ##

* Anaconda Installation
* Certificate generation

## Requirements

* Azure VM, IP address and Admin ID to access
* UBUNTU 18.04 LTS (*recommended*)

## Installation (recommended method)

* ssh to Azure machine `ssh -Y <adim_ID>@<VM_IP>`
* `git clone https://github.com/cemac/jupyterhub_on_azure.git`

## Usage ##

## COLLABORATING

Collaboration is very welcome and encouraged.
* A full guide on submitting issue and bug are given in our [contribution guidelines](https://github.com/cemac/jupyterhub_on_azure/blob/master/CONTRIBUTING.md)
* Please use our issue templates for feature requests and bug fixes.

<hr>

## ACKNOWLEGEMENTS

Thanks to Mike Croucher for Setting this up.

## LICENSE

This project is currently licensed under the [MIT license](https://choosealicense.com/licenses/mit/).
