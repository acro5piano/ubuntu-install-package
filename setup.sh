#!/bin/bash

# Move dotfile to home folder
cp -rf .config .emacs.d .vimrc .screenrc ~

# Move home folder
cd

# General update
sudo apt-get update
sudo apt-get upgrade

# Remove unnecessary items
sudo apt-get remove --purge -y netsurf*
rm -rf ~/.netsurf

# Language and inputs
sudo apt-get install -y fonts-takao fcitx fcitx-mozc language-pack-ja im-config fonts-wqy-zenhei emacs-mozc
im-config -n fcitx

# Development tools
sudo apt-get install -y vim net-tools bc gcc g++ make chromium-browser git screen ssh emacs tree colordiff

# Maintenance tools
sudo apt-get install -y gparted man

# UX utilities
sudo apt-get install -y touchegg rlwrap

# Multimedia
sudo apt-get install -y vlc ubuntu-restricted-extras

# For ruby installation
sudo apt-get install -y libreadline-dev libssl-dev libsqlite3-dev zlib1g-dev libyaml-dev libssl-dev libsqlite3-dev
sudo apt-get install -y sqlite3 libsqlite3-dev
sudo apt-get install -y imagemagick # MiniMagick RMagick
sudo apt-get install -y libxslt-dev libxml2-dev # Nokogiri
sudo apt-get install -y build-essential git-core curl libreadline6 libreadline6-dev libmysqlclient-dev libffi-dev nodejs

# Install ruby using rbenv + Ruby-build
if [ `which ruby | wc -l` -eq 0 ]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .bash_profile
    echo 'eval "$(rbenv init -)"' >> .bash_profile
    exec $SHELL -l
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv install -v 2.2.0
    rbenv rehash
    rbenv global 2.2.0
fi

# For python
sudo apt-get install -y python-dev python-pip python3 python3-pip gfortran liblapack-dev libpng12-dev libfreetype6-dev
pip install virtualenv
pip install jupyter

# For android
sudo apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6

# For Elasticsearch
sudo apt-get install -y openjdk-7-jdk

# Script for easily accessing gitignore boilerplates
sudo wget https://raw.githubusercontent.com/simonwhitaker/gibo/master/gibo -O /usr/bin/gibo
