# Ansible playbooks for my Fedora 26

Playbooks that bootstrap my many laptops so that I can go and sip tea while the Ansible is doing all the tedious work.

### Introduction

Argument `-K` is short for `--ask-become-pass` and is used only with tasks that needs root privileged (almost all of them).
When requested Ansible will escalate privileges by *becoming* another user (in this case root) whenever it's required.

### Install Ansible, Chrome, setup ssh keys and lastpass

Install ansible

    sudo dnf install -y libselinux-python python-dnf ansible
    ansible localhost -m ping

Clone this repo:

    git clone https://github.com/hoto/ansible-home-fedora.git

Install chrome:

    ansible-playbook chrome.yml -K

Generate ssh key:

    ssh-keygen -C <your_email_here>

Use lastpass and log in to chrome.

    sudo dnf install -y lastpass-cli
    lpass login <email>
    lpass show

Add ssh key to github, bitbucket and gitlab.

### Install core libraries and software

Run core roles:

        ansible-playbook software.yml -K

### Setup some stuff manually

* Manually change terminal setting to use Deja Vu Sans Mono font.

* Manually run jetbrain software and set desktop and commandline launchers from `Tools` menu:

        ./software/webstorm/.../bin/webstorm.sh
        ./software/pycharm/.../bin/pycharm.sh
        ./software/intellij/.../bin/idea.sh


### This will work only if you are me

Setup my home:

        ansible-playbook home.yml

## TODO
* Task to force cloning this project but with ssh origin instead of https? remove .git or use ansible force?
* Make gimp more like photoshop http://lifehacker.com/how-to-make-the-gimp-work-more-like-photoshop-1551318983 https://github.com/draekko/gimp-cc-themes
* Win+^ <- maximize window
* show all buttons in window tabs (minimize)