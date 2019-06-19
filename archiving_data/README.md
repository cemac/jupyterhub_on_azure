## Archiving JupyterHub users and data

These notes are an example of how data can be archived and removed, when a course which has used the JupyterHub system is complete.

In this case, the JupyterHub (`jupyterhub.service`) service was using a Python installation within `/opt/anaconda3`, with data directories at `/storage/earth_data/week*`, and various local usernames.

### Backing up / archiving / snapshotting data

The `make_snapshot` script was used to make a complete system backup.

In this case, the system has two storage volumes (in addition to the volume for the root file system), mounted at `/storage/earth_data` and `/storage/backup`, so that the data can be backed up in two locations.

The `make_snapshot` script is located within `/storage/earth_data/system/snapshots`, and needs to be run with root privileges:

```
cd /storage/earth_data/system/snapshots/
./make_snapshot
```

If this runs successfully, a new system backup should be created within `/storage/earth_data/system/snapshots` and copied to `/storage/backup/system/snapshots`.

The snapshot directories are named by date and time, with the most recent being linked at `latest`, for example `/storage/earth_data/system/snapshots/latest -> 20190607132548`.

The source and destination paths can be specified in the script, along with various other options:

```
data_src[0]='/'
data_src[1]='/storage/earth_data'
data_target[0]='root'
data_target[1]='data'
```

In this case the content of the root file system, `/`, will be backed up within a directory named `root`, and the contents of `earth_data` will be backed up within a directory named `data`.

### Disabling and removing JupyterHub service

First, the systemd service was stopped and disabled:

```
systemctl stop jupyterhub.service
systemctl disable jupyterhub.service
```

The service file and configuration was then removed:

```
rm /etc/systemd/system/jupyterhub.service
systemctl daemon-reload
rm /etc/jupyterhub/*
rmdir /etc/jupyterhub
```

### Removing Anaconda Python installation


# remove conda files

The Anaconda Python directory was removed:

```
rm -fr /opt/anaconda3/*
rmdir /opt/anaconda3
```

Any `~/.bashrc` files containing configuration particular to the Anaconda Python installation were manually updated, to remove any references to this installation / location.

### Removing system users

User accounts which were no longer required were removed from the system:

```
userdel -r instructor
userdel -r geosciences_instructor
for i in $(seq 1 3)
do
  userdel -r geosciences_demonstrator${i}
done
for i in $(seq 1 25)
do
  userdel -r geosciences_user${i}
done
for i in $(seq 1 42)
do
  userdel -r training_user${i}
done
```

This was followed by some minor home directory and group membership tidying:

```
chmod 700 /home/*
groupdel jupyterhub
gpasswd -d jupyteradmin shadow
```

### Remove data

Data directories which were no longer required were removed:

```
rm -fr /storage/earth_data/week*/*
rmdir /storage/earth_data/week*
```

### Update and reboot

As a final step, the system was updated and rebooted:

```
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt-get autoremove
reboot
```
