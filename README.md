# Ansible playbooks for my Fedora 25

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

    ansible-playbook 01_chrome.yml -K

Generate ssh key:

    ssh-keygen -C <your_email_here>

Use lastpass and log in to chrome.

    sudo dnf install -y lastpass-cli
    lpass login <email>
    lpass show

Add ssh key to github, bitbucket and gitlab.

### Install core libraries and software

Run core roles:

        ansible-playbook 02_core.yml -K

Manually run jetbrain software and set desktop and commandline launchers from `Tools` menu:

        ./software/webstorm/.../bin/webstorm.sh
        ./software/pycharm/.../bin/pycharm.sh
        ./software/intellij/.../bin/idea.sh

### Setup some stuff manually

Manually change terminal setting to use Deja Vu Sans Mono font.

Turn off suspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'.

### This will work only if you are me

Install private semi secure configs:

        ansible-playbook 03_secure.yml

Go to my work git repo and add ssh key there.

Clone all git project:

        ansible-playbook 04_projects.yml --ask-vault-pass

To encrypt/decrypt projects list:

        ansible-vault encrypt roles/clone_git_projects/tasks/git_projects_cloner.yml
        ansible-vault decrypt roles/clone_git_projects/tasks/git_projects_cloner.yml

## TODO
* Automate: Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'
* Make `ctrl + alt + t` open Tilix
* Install OBS video capture software -> https://github.com/jp9000/obs-studio/wiki/Install-Instructions#linux
* task to force cloning this project but with ssh origin instead of https? remove .git or use ansible force?
* Alt + mouse click -> move window, https://ask.fedoraproject.org/en/question/8267/alt-drag-to-move-windows-does-not-work-in-fedora-18/
* Change terminal font using gsettings maybe?
