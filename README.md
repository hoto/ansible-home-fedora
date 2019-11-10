# Ansible playbooks for my Fedora 28 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip yorkshire tea while the ansible is doing all the tedious work.

### Start

Set hostname:

    hostnamectl set-hostname <name>

Generate ssh keys:

    export HOSTNAME=$(hostname)
    ssh-keygen -C $USER@$HOSTNAME
    ssh-keygen -o -a 100 -t ed25519 -C $USER@$HOSTNAME
    
Clone this repo:

    mkdir -p ~/projects/github/hoto
    cd ~/projects/github/hoto
    git clone https://github.com/hoto/ansible-home-fedora.git

Install ansible and dependencies:

    sudo dnf install ansible

Install chrome:

    ansible-playbook chrome.yml -K

Add ssh key to github:

    https://github.com/settings/keys

Clone and setup home:

    ansible-playbook home.yml

Set ssh config permissions:

    chmod 600 ~/.ssh/config

Install software:

    ansible-playbook software.yml -K

TODO:
- install slack using flackpack
- install peek using flackpack
- fix ~/.ssh/config symlink permissions issues
- add jetbrains toolbox installation
- add fuzzy-repo-finder installation
- add CI
