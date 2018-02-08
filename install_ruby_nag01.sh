#!/bin/bash

# Ruby is the backbone of dashing project hence an ultimate dependency.
# The detailed installation has been documented at http://www.cyberkeeda.com/2018/02/ruby-installation-on-centos-with-rvm.html

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

wget http://xxx.xx.xx.xx/nagraj.tar.gz
tar -xvf  nagraj.tar.gz

cd nagraj
rm -rf history.yml

echo "Please enter your nagios url only, don't add /nagios in the end"
echo "Example : http://mynagios.server.com "
read -p 'Your Nagios Monitoring Server URL, include http/https://yournagiosURL  : ' url

read -p 'Your Nagios Username  : ' usr
read -p 'Your Nagios Username"s password  : ' pass


sed  -i "s,https://nagios.example.com,$url,g" jobs/sample.rb
sed  -i "s,nagiosadmin:redhat@123,$usr:$pass,g" jobs/sample.rb
sed  -i "s,https://nagios.example.com,$url,g" jobs/hostup.rb
sed  -i "s,https://nagios.example.com,$url,g" dashboards/nagios.erb
sed  -i "s,https://nagios.example.com,$url,g" dashboards/sample.erb

chown -R dashingadmin.dashingadmin /home/dashingadmin/nagraj/

su dashingadmin -c 'bundle'
su dashingadmin -c 'dashing start'
