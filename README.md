# Ansible playbooks for my Fedora 26 laptops
Playbooks that bootstrap my many fedora laptops so that I can go and sip yorkshire tea while the ansible is doing all the tedious work.

### Start
Generate ssh keys:

    ssh-keygen -C $USER@$HOSTNAME
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

TODO:
- download latest jetbrains programs https://www.jetbrains.com/updates/updates.xml
- clone repositories for jetbrains programs using git
- fix wallpaper so it does not know what fedora version im using
- add desktop to explorer bookmarks and remove others /home/andrzej.rehmann/.config/gtk-3.0/bookmars
- /home/andrzej.rehmann/.config/gtk-3.0/user-dirs.dirs
- enable night light 
