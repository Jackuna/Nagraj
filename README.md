# NagRaj : dashing-nagios

### Under Development

Flat Nagios Dashing Dashboard based on Dashing project.
This Nagios Dashboard can be integrated with Nagios Core and NagiosXI both.
I have designed it to fit big monitors/TV screens kept within floor, to monitor on the way.


It has cool features like

* Cool dashboard with responsive layouts and Hotness Indicators [ Red & Green ]  and 

* Responsive Meter Widgets.

* Show your Custom Logo.

* 12 Hours Clock.

* Scrolling Message of the day or Informations to display at the bottom.

* Show Weather status with frequently changing color of dashlets and logo based on weather types.

* Every Host and Service dashlet has a meter with changing color scheme depending upon severity.

### Snapshots 
```
Snapshot 01 -- Applicable to Nagios XI
```
```
Snapshot 02 -- Applicable to Nagios Core
```

![Nagraj with NagiosXI](https://github.com/Jackuna/Nagraj/blob/master/NagRaj.jpg)

![Nagraj with Nagios Core ](https://github.com/Jackuna/Nagraj/blob/master/Nagraj_snap03.jpg)

![Nagraj](https://github.com/Jackuna/Nagraj/blob/master/anim_nagraj.gif)



### Installaton & Configuration

Overall we will be achieving the below bullet point to run nagraj
* Installation of Dependencies.
* Installation of Ruby from RVM
* Mandatory RubyGems installation.
* User selection/creation to run dashing application.
* Download Nagraj application.
* Configuration of Nagraj to retrive data from your Nagios Server.
* Bundle and run dashing application 

#### Installation of Dependencies.

```
yum -y install epel-release
yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel
yum -y install libyaml-devel libffi-devel openssl-devel make
yum -y install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
yum -y install openssl gcc-c++ make nodejs jq`
```
#### Installation of Ruby from RVM

```
curl -k https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable
```

###### Source RVM Enviroment varibles
` . /etc/profile.d/rvm.sh `

```
rvm install 2.5.0
rvm use 2.5.0 --default
ruby --version
```

#### Mandatory RubyGems installation.

```
gem install dashing
gem install bundler
```

#### User selection/creation to run dashing application.
By default ruby will not allow you to run dashing application by user root.
Either use your existing user or create a new user.
Here I will be using ` dashingadmin ` user to run our Sinatara based application Nagraj.

```
useradd dashingadmin
passwd dashingadmin

```
One can create user by anyname and place it's home directory as per choice.

#### Download Nagraj application and Configure Nagraj to retrive data from your Nagios Server.

Please note : any misconfiguration at this stage is vital, if mistakely you had put a wrong input you need to re download the repository and reconfigure here, else you need to manualy edit some files.Once user created let's move to next part.


```
su - dashingadmin

git clone nagraj_master_repo_link.git

cd Nagraj

chmod 700 config_nagraj.sh

./config_nagraj.sh
 
```
Provide it the requested inputs, it would be mainly the nagios server url and nagios WebUI id & pass.

#### Bundle and run dashing application

I still assume, you are are into Nagraj directory and navigating through dashingadmin user.
If not,

> su - dashingadmin; cd Nagraj

```
bundle install --path vendor/bundle

dashing start

```


