# Tips for the future #

This years set up was done with a time pressure of one day to transfer from Mike's initial set up. As the current set up is working there are future improvements that will be documented here.


## Monitoring

* [Via Azure](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/data-collection)
* Server side - unknown as of yet

<hr>

# Smoothness of jupyterhub set up

Current set up is a bit rough and ready as improvements crop up I'll add them here.

1. Course specific groups
  ```bash
  sudo groupadd SOEEXXYY  # create group
  # putting the student home directory is on a separate drive on this workstation
  sudo useradd -G SOEEXXYY -d /storage/earthdata/home/student_username_here student_username_here
  # Allow use of jupyterhub
  sudo useradd -G jupyterhub <user_name>
  ```
  * That way you wouldn't have to fiddle with configureation but can set group permissions
  ```python
  # Add to jupyterhub_config.py
  c.LocalAuthenticator.group_whitelist = {'SOEEXXYY'}
  ```
