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
* Tweaking Widgets

#### Installation of Dependencies.

```
yum -y install epel-release
yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel
yum -y install libyaml-devel libffi-devel openssl-devel make
yum -y install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel
yum -y install openssl gcc-c++ make nodejs jq git
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

git clone https://github.com/Jackuna/nagraj.git

cd Nagraj

chmod 700 config_nagraj.sh

./config_nagraj.sh
 
```
Provide it the requested inputs, it would be mainly the nagios server url and nagios WebUI id & pass.

#### Bundle and run dashing application

I still assume, you are are into Nagraj directory and navigating through dashingadmin user.
If not,

> su - dashingadmin; cd nagraj

You must be under nagraj directory to run the below commands
```
bundle install --path vendor/bundle

dashing start

```
To run dashing in background

>   dashing start -d


### So you are all set to run your nagraj dashing-nagios application.

Point the below links from your browser.

Applicable to low screen resolutions

` http:<your server ip>:3030/nagraj ` 

Applicable to bigger screen resolutions monitors/tvscreens 

`http:<your server ip>:3030/nagrajtv  `


Though you can anytime change the dashlets height & width by changing nagraj.erb and nagajtv.erb files placed within `nagraj/dashboards` directory.

```  Dashing.widget_base_dimensions = [280,300] ```

##### Update it to fit your screen resolution, but don't make it lesser then the defaults else it will loose it's coolness and charm

#### Tweakin Widgets.

1. Ticker widget. Credits (https://gist.github.com/toddq/6527361) 

Scroll your updates, news, office gossips, circular information , notifications etc at the footer part of nagraj. 

![Ticker](https://github.com/Jackuna/nagraj/blob/master/ticker.png)

toggle into  `  nagraj/jobs/ticker.rb `

Append any messages one by one within " ", so that it cn pick it as a array.

Below is such an example that scrolls custom messages.

```
ticker_items = [
  "NagiosXI Custom Dashing dashbpard is on the way..",
	" It's a cool widget afterall.. and it needs some more time"
]

````
There are two modes to scroll text within this widget `vertically ` or ` horizontally.`
How to apply it :  https://gist.github.com/toddq/6527361

What if you don't have any messages for the time being or you need to simply hide this widget.

The widget is not displayed by default, and will only display if it has content. You send it an array of any number of Strings, and it will rotate through them. If you send it an empty array, it will hide itself again.

