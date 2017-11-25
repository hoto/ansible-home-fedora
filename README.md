# Ansible playbooks for my Fedora 26 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip tea while the ansible is doing all the tedious work.

### Start
Generate ssh key:

    ssh-keygen -C <your_email_here>
    
Add ssh key to bitbucket and github.

Clone this repo:

    git clone git@bitbucket.org:hoto/ansible-home-fedora.git

Install ansible and dependencies:

    sudo dnf install ansible python-dnf libselinux-python

Install chrome:

    ansible-playbook chrome.yml -K

Clone and setup my home:

    ansible-playbook home.yml
    
Install software:

    ansible-playbook software.yml -K

### Setup jetbrains
Manually run jetbrains software and set desktop and commandline launchers from `Tools` menu:

    ./software/intellij/.../bin/idea.sh
    ./software/webstorm/.../bin/webstorm.sh
    ./software/pycharm/.../bin/pycharm.sh

