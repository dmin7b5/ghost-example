ghost-example
=============

While Ghost has a Vagrant project that allows developers to test the latest code, it didn't work for me out of the box, hence the reason for this project.  This project creates a Ghost Blog for testing on an Ubuntu Virtual Machine using VirtualBox.  It uses Vagrant and Chef to install Nginx, node.js, npm, Sqlite, and all other required dependencies.

The project has been tested on a Mac, though it should work on Linux and Windows (using Cygwin). YMMV

##Requirements

* VirtualBox - [download link](https://www.virtualbox.org/wiki/Downloads)
* Vagrant - [download link](http://www.vagrantup.com/downloads.html)

NOTE: Homebrew runs on OSX only so you will need to install Git another way than below if you are using Linux or Windows.

* [Install Homebrew and Git](http://brew.sh)

```
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew install git
```

* [Install RVM](https://rvm.io/rvm/install)

```
    curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby=2.1.0
    rvm --default use 2.1.0
```

* Create a new ghost folder under your Documents folder and change into that new ghost directory:

```
    mkdir ~/ghost
    cd ~/ghost
```

* Download this ghost-example Git repository that contains everything you need to install a new Ubuntu server inside Virtualbox with all the software to run a local Ghost blog:

```
    git clone --recursive git@github.com:dmin7b5/ghost-example.git
    cd ghost-example
```

* Install required gems and checkout git master for submodules

```
    bundle
    bundle exec berks install --path cookbooks/
    git submodule foreach --recursive git checkout master
```
    
* Edit Your Hosts File to setup the Ghost local URL

```
    sudo nano /etc/hosts
```

* Paste the following at the end of the file and save it (CTL + X)

```
    33.33.33.10 ghost.dev
```
    
* Close your browser and reopen it (this will force the browser to read the changes you made to the /etc/hosts file

* Startup Vagrant and login to the VM

```
    vagrant up
    vagrant ssh
```

* Change to the ghost directory to compile Ghost modules

```
    cd /vagrant/ghost
    sudo npm install -g grunt-cli
    sudo npm install
    grunt init
```
    
* Start Ghost!

```
    npm start
```
    
* Go to your Ghost blog and create your Admin account: http://ghost.dev/ghost/.

* Have fun playing with Ghost!


