# Ansible playbooks for my Fedora 25

### Before we start

`-K` is short for `--ask-become-pass` is used only with tasks that needs root privileged.

Ansible will escalate privileges by `becoming` another user (root) whenever it's required, so it will use your user by default.


### Start

Generate ssh key:

    ssh-keygen -C <your_emai_here>

Install laspass and ansible

    sudo dnf install -y lastpass-cli
    sudo dnf install -y libselinux-python python-dnf ansible

Go to github and clone this repo via https:

    git clone https://github.com/hoto/ansible-home-fedora.git

Test Ansible then run all initial setup roles:

    ansible localhost -m ping
    ansible-playbook init.yml --tags facts
    ansible-playbook init.yml -K

Use lastpass to log in to chrome, github and bitbucket (add your ssh key)

    lpass login <email>
    lpass show

Run core roles:

        ansible-playbook master.yml -K

Run webstorm, intellij and pycharm from terminal and set desktop and commandline entries:

        ./software/webstorm/.../bin/webstorm.sh
        ./software/pycharm/.../bin/pycharm.sh
        ./software/intellij/.../bin/idea.sh
        
Install private semi secure configs:

        ansible-playbook private_home.yml

Manually change terminal setting to use Deja Vu Sans Mono font.

Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'.


### Private 

Go to my work git repo and add ssh key there.

Clone all git project:

        ansible-playbook private_projects.yml --ask-vault-pass
        
To encrypt/decrypt projects list:

        ansible-vault encrypt roles/git_projects/tasks/git_projects_cloner.yml
        ansible-vault decrypt roles/git_projects/tasks/git_projects_cloner.yml


## TODO
* terminix config, where is it? gsettgins?
* Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'
* shortcut for terminix ctrl alt t instead of default terminal
* remove ctrl alt t from default terminal and add a custrom shortcut:
* OBS https://github.com/jp9000/obs-studio/wiki/Install-Instructions#linux
* task to force cloning this project but with ssh origin instead of https? remove .git or use ansible force?
* remove bookmarst from /home/andrzej/.config/gtk-3.0/bookmarks
* ubunt://ask.fedoraproject.org/en/question/55652/how-to-see-desktop-files-and-folders/ 