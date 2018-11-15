#!/bin/bash

# Installation of Required dependency mandatory Packages

yum -y install epel-release
yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel
yum -y install libyaml-devel libffi-devel openssl-devel make
yum -y install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
yum -y install openssl gcc-c++ make nodejs jq

# Installation of RVM begins here

curl -k https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable

# Setup of rvm environment.

. /etc/profile.d/rvm.sh

rvm reload

# Ensure RVM Dependencies

rvm requirements run

# Installation of Ruby 2.5.0
rvm install 2.5.3
rvm use 2.5.3 --default
ruby --version

gem install dashing
gem install bundler
2.5.0


