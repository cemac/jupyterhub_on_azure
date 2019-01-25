# Setting up the UBUNTU server #

These files help you set up the intial configuration of the UBUNTU server

# Requirements

* be logged on VM with admin privileges

# Contents

* [ubuntu_essentials.sh]() The full set up bash commands to set up Ubuntu server
* [.bashrc]() - example .bashrc file
* [init.el]() - emacs editor setting to stop annoying buffers *if use emacs*

# Usage

1. Clone this Repo to the VM if you have not done so already.
`git clone https://github.com/cemac/jupyterhub_on_azure.git`
2. Follow [install.sh]() *recommended to not just run encase you require customized settings*
3. Use any files such as .bashrc  where required

<hr>

# ubuntu_essentials.sh #

## Section 1

1. Update system (there may be security patches bug fixes etc)
2. Set up and Configure firewall and allows ssh connections. IT may
have palatially done this.
  *Tip - check IPV6 is enabled*
  `sudo grep IPV6 /etc/default/ufw`
  *Tip - all `ufw` commands require sudo*
3. Set up favourite editor e.g. emacs use to configure .bashrc etc
  * can just `cp .bashrc ~/.bashrc` if want to use same as the example
