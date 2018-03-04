#!/bin/bash

cd  nagraj
rm -f history.yml

echo "Please enter your nagios url only, don't add /nagios in the end"
echo "Example : http://mynagios.server.com "
read -p 'Your Nagios Monitoring Server URL, include http/https://yournagiosURL  : ' url

read -p 'Your Nagios Username  : ' usr
read -p 'Your Nagios Username"s password  : ' pass


sed  -i "s,https://nagios.example.com,$url,g" jobs/nagraj.rb
sed  -i "s,nagiosadmin:123,$usr:$pass,g" jobs/nagraj.rb
sed  -i "s,http://nagios.example.com,$url,g" jobs/iframeload.rb


sed  -i "s,https://nagios.example.com,$url,g" dashboards/nagraj.erb
sed  -i "s,https://nagios.example.com,$url,g" dashboards/nagrajtv.erb
