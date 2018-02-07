#!/bin/bash

# Installation of Required dependency mandatory Packages

yum install gcc-c++ patch readline readline-devel zlib zlib-devel
yum install libyaml-devel libffi-devel openssl-devel make
yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel

# Installation of RVM begins here

curl -k https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable

# Setup of rvm environment.

. /etc/profile.d/rvm.sh

rvm reload

# Ensure RVM Dependencies

rvm requirements run

# Installation of Ruby 2.5.0
rvm install 2.5.0
rvm use 2.5.0 --default
ruby --version

