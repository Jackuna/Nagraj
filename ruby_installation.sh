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
rvm install 2.5.0
rvm use 2.5.0 --default
ruby --version

gem install dashing
gem install bundle


# Application Setup begins here.

useradd dashingadmin
usermod -p '0wPGGsC1N8yYk' dashingadmin


cd /home/dashingadmin/

wget https://github.com/Jackuna/Nagraj/archive/development.zip

unzip  development.zip
mv mv Nagraj-development nagraj


cd nagraj
rm -rf history.yml

echo "Please enter your nagios url only, don't add /nagios in the end"
echo "Example : http://mynagios.server.com "
read -p 'Your Nagios Monitoring Server URL, include http/https://yournagiosURL  : ' url

read -p 'Your Nagios Username  : ' usr
read -p 'Your Nagios Username"s password  : ' pass


sed  -i "s,https://nagios.example.com,$url,g" jobs/nagraj.rb
sed  -i "s,nagiosadmin:123,$usr:$pass,g" jobs/nagraj.rb

sed  -i "s,https://nagios.example.com,$url,g" dashboards/nagraj.erb
sed  -i "s,https://nagios.example.com,$url,g" dashboards/nagrajtv.erb

chown -R dashingadmin.dashingadmin /home/dashingadmin/nagraj/

su dashingadmin -c 'bundle'
su dashingadmin -c 'dashing start'
