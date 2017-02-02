#!/usr/bin/env bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install \
  software-properties-common \
  python \
  python-dev \
  python-pip \
  python-virtualenv
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt -y update
sudo apt -y install ansible
