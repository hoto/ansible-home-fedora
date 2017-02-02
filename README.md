# Ansible playbooks for my personal desktop Ubuntu 16.04

### Before we start

`-K` is short for `--ask-become-pass` is used only with tasks that needs root privileged.

Ansible will escalate privileges by `becoming` another user (root) whenever it's required, so it will use your user by default.


### Run

* After installing new ubuntu generate ssh key

        ssh-keygen -C <your_emai_here>

* Install git

        sudo apt install git

* Go to github and clone this repo via https

* Install Ansible, Python and Pip (python package manager)

        ./install-python-and-ansible.sh

* Test Ansible

        ansible localhost -m ping

* Display facts discovered about your machine and check if what you see is correct:

        ansible-playbook boot.yml --tags facts
        

* Run all tasks in boot.yml:

        ansible-playbook boot.yml -K

* Use lastpass to log in to chrome, github and bitbucket. Add your ssh key there.

* Run all tasks in master.yml:

        ansible-playbook master.yml -K

* Run webstorm, intellij and pycharm from terminal and set desktop and commandline entries:

        ./software/webstorm/.../bin/webstorm.sh
        ./software/pycharm/.../bin/pycharm.sh
        ./software/intellij/.../bin/idea.sh
        
* Install private semi secure configs

        ansible-playbook private_home.yml

* Manually change terminal setting to use Deja Vu Sans Mono font

* Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'


### Cloning my projects (without a pass you won't be able to do it)

* Go to my work git repo and add sh key

* Clone all git project

        ansible-playbook private_projects.yml --ask-vault-pass
        
* Encrypt/decrypt projects list

        ansible-vault encrypt roles/git_projects/tasks/git_projects_cloner.yml
        ansible-vault decrypt roles/git_projects/tasks/git_projects_cloner.yml


## TODO
* terminix config, where is it? gsettgins?
* Turn off susspend when lid is closed Start -> Power -> 'When lid is closed -> do nothing'
* arc -> unity tweak tool config, where is it? gsettgins?
* shortcut for terminix ctrl alt t instead of default terminal

remove ctrl alt t from default terminal and add a custrom shortcut:

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'terminix'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Primary><Alt>t'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'terminix'"

there is something broken with my gsettings and dconf so it won't save any of these, need to do it from some other pc
* OBS https://github.com/jp9000/obs-studio/wiki/Install-Instructions#linux
* task to force cloning this project but with ssh origin instead of https? remove .git or use ansible force?
* fix virtualbox task
TASK [virtualbox : Download virtualbox] ****************************************
fatal: [localhost]: FAILED! => {"failed": true, "msg": "the field 'args' has an invalid value, which appears to include a variable that is undefined. The error was: 'dict object' has no attribute 'version'\n\nThe error appears to have been in '/home/andrzej/git/hoto/ansible-home/roles/virtualbox/tasks/virtualbox_installer.yml': line 2, column 3, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n---\n- name: Download virtualbox\n  ^ here\n"}

PLAY RECAP *********************************************************************
localhost    
* remove bookmarst from /home/andrzej/.config/gtk-3.0/bookmarks
