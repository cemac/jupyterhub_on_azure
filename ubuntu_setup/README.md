# Setting up the UBUNTU server #

These files help you set up the intial configuration of the UBUNTU server

# Requirements

* be logged on VM with admin privileges

# Contents

* [ubuntu_essentials.sh]() The full set up bash commands to set up Ubuntu server
* [.bashrc](./.bashrc) - example .bashrc file
* [init.el](./init.el) - emacs editor setting to stop annoying buffers *if use emacs*
* [gen_users.sh]()./gen_users.sh) shell script to create all user accounts

# Usage

1. Clone this Repo to the VM if you have not done so already.
`git clone https://github.com/cemac/jupyterhub_on_azure.git`
2. Follow [install.sh]() *recommended to not just run encase you require customized settings*
3. Use any files such as .bashrc  where required

<hr>

# ubuntu_essentials.sh #

## Section 1 - Security and set up

1. Update system (there may be security patches bug fixes etc)
2. Set up and Configure firewall and allows ssh connections. IT may
have palatially done this.
  *Tip - check IPV6 is enabled*
  `sudo grep IPV6 /etc/default/ufw`
  *Tip - all `ufw` commands require sudo*
3. Set up favourite editor e.g. emacs use to configure .bashrc etc
  * can just `cp .bashrc ~/.bashrc` if want to use same as the example
4. Optional set up Azure CLI (if have access to Azure account)

## Section 2 - Users

1. edit `etc/skel/.bashrc` using favourite editor with sudo
add aliases etc you want to be default across users e.g.
  ```bash
  # Personal aliases:
  alias rm='rm -i'
  alias mv='mv -i'
  alias cp='cp -i'
  ```
2. Alter settings and set number of users e.g. 42
3. Running ./gen_users.sh creates random passwords for 42 training users and 1 instructor
  unless set otherwise. You will now have all the user accounts on the machine.
4. Linux groups: To use jupyter hub server a jupyterhub group is created and the
  users are added to that group.
5. The instructor is added to an addtional instructor group

## Section 3 - backups

The disks were mounted by IT at /storage backup and earthdata



## Next Step ##

Now the server is ready to set up python and jupyterhub

Follow the steps in [python_setup](../python_setup).
