# Ansible playbooks for my Fedora 26 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip tea while the ansible is doing all the tedious work.

### Start
Install ansible and dependencies:

    sudo dnf install ansible python-dnf libselinux-python

Clone this repo:

    git clone git@bitbucket.org:hoto/ansible-home-fedora.git

Install chrome:

    ansible-playbook chrome.yml -K

Install software:

    ansible-playbook software.yml -K

### Setup some stuff manually
Generate ssh key:

    ssh-keygen -C <your_email_here>
    
Manually run jetbrains software and set desktop and commandline launchers from `Tools` menu:

    ./software/webstorm/.../bin/webstorm.sh
    ./software/pycharm/.../bin/pycharm.sh
    ./software/intellij/.../bin/idea.sh

### You don't want to do this unless you are me
Clone and setup my home:

    ansible-playbook home.yml
        
Add ssh key to github, bitbucket and gitlab.

### TODO:
- .ideavimrc symlink
- add shortcuts for jetbrains 
