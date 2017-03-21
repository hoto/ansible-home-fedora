# Ansible playbooks for my Fedora 25

### Before we start

`-K` is short for `--ask-become-pass` is used only with tasks that needs root privileged.

Ansible will escalate privileges by `becoming` another user (root) whenever it's required, so it will use your user by default.


### Start (Chrome + ssh keys)

Install ansible

    sudo dnf install -y libselinux-python python-dnf ansible
    ansible localhost -m ping

Go to github and clone this repo via https:

    git clone https://github.com/hoto/ansible-home-fedora.git

Check if gathered facts are correct:

    ansible-playbook chrome.yml --tags facts

Install chrome:

    ansible-playbook chrome.yml -K

Generate ssh key:

    ssh-keygen -C <your_email_here>

Use lastpass and log in to chrome.

    sudo dnf install -y lastpass-cli
    lpass login <email>
    lpass show

Add ssh key to github, bitbucket and gitlab.

### Core stuff

Run core roles:

        ansible-playbook core.yml -K

Run webstorm, intellij and pycharm and set desktop and commandline launchers:

        ./software/webstorm/.../bin/webstorm.sh
        ./software/pycharm/.../bin/pycharm.sh
        ./software/intellij/.../bin/idea.sh
        
Install private semi secure configs:

        ansible-playbook secure.yml

Manually change terminal setting to use Deja Vu Sans Mono font.

Turn off suspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'.


### Private stuff (won't work for you)

Go to my work git repo and add ssh key there.

Clone all git project:

        ansible-playbook projects.yml --ask-vault-pass
        
To encrypt/decrypt projects list:

        ansible-vault encrypt roles/clone_git_projects/tasks/git_projects_cloner.yml
        ansible-vault decrypt roles/clone_git_projects/tasks/git_projects_cloner.yml


## TODO
* Change peek playbook to use new installer https://github.com/phw/peek#fedora
* Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'
* Change `ctrl + alt + t` to Tilix
* OBS video capture -> https://github.com/jp9000/obs-studio/wiki/Install-Instructions#linux
* task to force cloning this project but with ssh origin instead of https? remove .git or use ansible force?
* Alt + mouse click -> move window, https://ask.fedoraproject.org/en/question/8267/alt-drag-to-move-windows-does-not-work-in-fedora-18/