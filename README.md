# Ansible playbooks for my Fedora 26 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip yorkshire tea while the ansible is doing all the tedious work.

### Start
Generate ssh keys:

    ssh-keygen -o -a 100 -C $USER@$HOSTNAME
    ssh-keygen -o -a 100 -t ed25519 -C $USER@$HOSTNAME
    
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

TODO:
- create shortcut for all jetbrains programms
- update symlinks for jetbrains programms
- download latest jetbrains programs https://www.jetbrains.com/updates/updates.xml
- fix wallpaper so it does not know what fedora version im using
