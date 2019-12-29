# Ansible playbooks for my Fedora 28 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip yorkshire tea while ansible is doing all the tedious work.

### Start

Update os:

    sudo dnf update -y

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

    git remote remove origin
    git remote add origin git@github.com:hoto/ansible-home-fedora.git

Install ansible and dependencies:

    sudo dnf install ansible

Install chrome:

    ansible-playbook chrome.yml -K

Add ssh key to github:

    https://github.com/settings/keys

Clone and setup symlinks for `home` and `home-private` repos:

    ansible-playbook home.yml

Install software:

    ansible-playbook software.yml -K

TODO:
- install slack using flackpack
- install peek using flackpack
- add jetbrains toolbox installation
- add fuzzy-repo-finder installation
- add CI
- remove python 3 as interpreter, it should now be the default used by ansible
- disable automatic suspend (hibernation)
