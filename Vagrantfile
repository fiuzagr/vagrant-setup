# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "denver"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3001, host: 3001

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
   config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder '~/Code', "/home/vagrant/VBOX/Code",
    create: true,
    group: "www-data",
    owner: "vagrant",
    mount_options: ["dmode=775,fmode=775"]
  config.vm.synced_folder '~/Public/NUTS', "/home/vagrant/VBOX/Nuts",
    create: true,
    group: "www-data",
    owner: "vagrant",
    mount_options: ["dmode=775,fmode=775"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "2048"

    # Define name
    vb.name = "Denver"

    # Symlinks
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate", "1"]
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.


  # Copy Apache Files
  config.vm.provision "file",
    source: "apache/",
    destination: "~/apache/"


  $root = <<-SHELL
    # LAMP SERVER && DEV TOOLS
      sudo apt-get update
      debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
      debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
      sudo apt-get install -y \
        apache2 \
        mysql-server \
        git wget curl zsh vim-nox ctags htop
    # Tmux
      sudo apt-get install -y python-software-properties software-properties-common
      sudo add-apt-repository -y ppa:pi-rho/dev
      sudo apt-get update
      sudo apt-get install -y tmux
    #PHPBREW (FAIL TO ALL)
      sudo apt-get build-dep -y php5
      sudo apt-get install -y \
        php5-dev php5-mysql php5-sqlite php5-gd php5-mcrypt php-pear libapache2-mod-php5 \
        libreadline-dev libgettextpo-dev libgettextpo0 libmcrypt-dev libc-client2007e-dev
      sudo chmod -R oga+rw /usr/lib/apache2/modules
      sudo chmod -R oga+rw /etc/apache2
      sudo ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h
      sudo ln -s /usr/lib/libc-client.a /usr/lib/x86_64-linux-gnu/libc-client.a
    # SERVER NAME FIX APACHE
      echo '\nServerName 127.0.0.1' >> /etc/apache2/ports.conf
    # APACHE
      sudo a2enmod rewrite vhost_alias
      sudo mv /home/vagrant/apache/* /etc/apache2/sites-available/ && rm -rf /home/vagrant/apache
      sudo a2ensite dev.conf clientes.nuts.conf
    # APACHE PHP DEV
      sed -i 's/^display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
      sed -i 's/^display_startup_errors = Off/display_startup_errors = On/' /etc/php5/apache2/php.ini
      sed -i 's/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php5/apache2/php.ini
    # APACHE RESTART
      sudo service apache2 restart
    # LANG SSH FIX
      sed -i 's/^AcceptEnv LANG LC_*/# AcceptEnv LANG LC_*/' /etc/ssh/sshd_config
      echo 'LC_ALL="en_US.UTF-8"' > /etc/default/locale
    # CHANGE TO ZSH
      sudo chsh -s /bin/zsh vagrant
  SHELL
  config.vm.provision "shell", inline: $root, privileged: true

  $user = <<-SHELL
    # Local Binaries
      mkdir -p /home/vagrant/.local/bin 2> /dev/null # silent

    # Composer
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/home/vagrant/.local/bin --filename=composer

    # PHPBrew
      curl -L  -o /home/vagrant/.local/bin/phpbrew https://github.com/phpbrew/phpbrew/raw/master/phpbrew

    # NVM
      curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

    # PYENV
      #git clone https://github.com/yyuu/pyenv.git ~/.pyenv

    # RBENV
      #git clone https://github.com/rbenv/rbenv.git ~/.rbenv

    # PLENV
      #git clone https://github.com/tokuhirom/plenv.git ~/.plenv

    # PERMISSIONS
      chmod -R +x /home/vagrant/.local/bin/

    # My ENV
      sh -c "$(wget https://raw.github.com/fiuzagr/env/master/tools/install.sh -O -)"
  SHELL
  config.vm.provision "shell", inline: $user, privileged: false


  $dev = <<-SHELL
    # NVM Install
      . /home/vagrant/.nvm/nvm.sh
      nvm install 5
      nvm alias default v5

    # NPM Install
      npm install -g grunt-cli gulp bower webpack

    # PHPBrew Init
      /home/vagrant/.local/bin/phpbrew init

    # Laravel Cli
      /home/vagrant/.local/bin/composer global require "laravel/installer"
  SHELL
  config.vm.provision "shell", inline: $dev, privileged: false
end
