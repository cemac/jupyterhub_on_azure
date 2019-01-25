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
# Update node
npm cache clean -f
npm install -g n
sudo /opt/anaconda3/bin/n stable
# install configurable-http-proxy
npm install -g configurable-http-proxy
# Generate default config
jupyterhub --generate-config
sudo /opt/anaconda3/bin/jupyter nbextension install --system --py nbgrader --overwrite
sudo /opt/anaconda3/bin/jupyter nbextension enable --system --py nbgrader
sudo /opt/anaconda3/bin/jupyter serverextension enable --system --py nbgrader
# Disable create assignment for all users and then enable it for instructor only
# Following the prodedure at https://nbgrader.readthedocs.io/en/latest/user_guide/installation.html retrieved 11/12/2018
jupyter nbextension disable --sys-prefix create_assignment/main
sudo -H -u instructor /opt/anaconda3/bin/jupyter nbextension enable --user create_assignment/main

# Move certificate files
secretsname=$(sudo find /var/lib/waagent/ -name "*.prv" | cut -c -57)
sudo mkdir -p /etc/jupyter/ssl
# I had to use the secretsname to manually
echo $secretsname
# 1st entry is the .crt and 2nd entry is the .prv
sudo cp $secretsname.crt /etc/jupyter/ssl/mycert.cert
sudo cp $secretsname.prv /etc/jupyter/ssl/mycert.prv

# Make certificate files readable by the user under which we will run the jupyterhub service
sudo chgrp jupyteradmin /etc/jupyter/ssl/mycert.prv
sudo chgrp jupyteradmin /etc/jupyter/ssl/mycert.p
sudo chmod g+r /etc/jupyter/ssl/mycert.cert
sudo chmod g+r /etc/jupyter/ssl/mycert.prv

# Configure certificate in Jupyterhub
cat << EOF >> ./jupyterhub_config.py
c.JupyterHub.ssl_key = '/etc/jupyter/ssl/mycert.prv'
c.JupyterHub.ssl_cert = '/etc/jupyter/ssl/mycert.cert'
EOF

# Run on port 443 so that it uses https
cat << EOF >> ./jupyterhub_config.py
c.JupyterHub.port = 443
EOF

# Redirect http:// to https://
cat << EOF >> ./jupyterhub_config.py
c.ConfigurableHTTPProxy.command = ['configurable-http-proxy', '--redirect-port', '80']
EOF

# Add jupyterhub admin users
cat << EOF >> ./jupyterhub_config.py
c.Authenticator.admin_users = {'jupyteradmin', 'instructor'}
EOF

# copy the Jupyterhub config file
sudo mkdir -p /etc/jupyterhub
sudo cp ./jupyterhub_config.py /etc/jupyterhub/jupyterhub_config.py
sudo chown -R jupyteradmin:jupyteradmin /etc/jupyterhub/

# Set up sudospawner
# Following docs at https://github.com/jupyterhub/jupyterhub/wiki/Using-sudo-to-run-JupyterHub-without-root-privileges retrieved 19th September 2018
echo "Cmnd_Alias JUPYTER_CMD=/usr/local/bin/sudospawner" | sudo tee -a /etc/sudoers
echo "%jupyterhub ALL=(jupyteradmin) /usr/bin/sudo" | sudo tee -a /etc/sudoers
echo "jupyteradmin ALL=(%jupyterhub) NOPASSWD:JUPYTER_CMD" | sudo tee -a /etc/sudoers

# Set up jupyterhub as a service
sudo cp ./jupyterhub.service /etc/systemd/system/jupyterhub.service

# Make our user part of the shadow group so that PAM authentication works
sudo usermod -a -G shadow jupyteradmin

#Do this next line or we'll not be able to connect to port 443
#Details at https://github.com/jupyterhub/jupyterhub/issues/774
sudo setcap 'cap_net_bind_service=+ep' `which nodejs`
sudo setcap 'cap_net_bind_service=+ep' `which node`

#Enable the jupyterhub service so it starts at boot
sudo systemctl enable jupyterhub
#start the service now
sudo systemctl start jupyterhub
