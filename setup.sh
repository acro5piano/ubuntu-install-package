#!/bin/bash

# General update
apt-get update
apt-get upgrade

# Remove unuse items
apt-get remove --purge -y netsurf*
rm -rf ~/.netsurf

# Language and inputs
apt-get install -y fonts-takao fcitx fcitx-mozc language-pack-ja im-config fonts-wqy-zenhei emacs-mozc
im-config -n fcitx

# Development tools
apt-get install -y vim net-tools bc gcc g++ make chromium-browser git screen ssh emacs 

# Maintenance tools
apt-get install -y gparted 

# UX utilities
apt-get install -y touchegg 

# Multimedia
apt-get install -y vlc ubuntu-restricted-extras 

# For ruby installation
apt-get install -y libreadline-dev libssl-dev libsqlite3-dev zlib1g-dev libyaml-dev libssl-dev libsqlite3-dev 
apt-get install -y sqlite3 libsqlite3-dev # SQLite
apt-get install -y imagemagick # MiniMagick RMagick
apt-get install -y libxslt-dev libxml2-dev # Nokogiri(kaminari...)
apt-get install -y build-essential git-core curl libreadline6 libreadline6-dev libmysqlclient-dev libffi-dev nodejs

# for python
apt-get install -y python-dev python-pip python3 python3-pip gfortran liblapack-dev
pip install virtualenv

# For android 
apt-get install -y lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
