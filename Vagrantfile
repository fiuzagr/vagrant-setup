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
  config.vm.hostname = "ubuntu"

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
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder '~/Public/', "/home/vagrant/VBOX", 
    create: true,
    group: "www-data",
    owner: "vagrant",
    mount_options: ["dmode=775,fmode=664"]

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "1024"

    # Define name
    vb.name = "UBUNTU"

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
  $root = <<-SHELL
    # LAMP SERVER && DEV TOOLS
      debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
      debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
      sudo apt-get install -y \
        apache2 \
        mysql-server \
        php5 php5-mysql php5-sqlite php5-gd php5-mcrypt libapache2-mod-php5 \
        git tmux zsh vim-nox ctags
    # VERIFICAR ESSA MERDA
      # sed -i 's/^\# /etc/apache2/sites-enabled/000-default.conf/ServerName 127.0.0.1/' /etc/apache2/ports.conf
    # APACHE
      sudo a2enmod rewrite
      sudo a2enmod vhost_alias
      mkdir /home/vagrant/VBOX/DEV
      wget -P /etc/apache2/sites-available/ https://raw.githubusercontent.com/meteoro/vagrant-setup/master/apache/clientes.dev.conf
      sudo a2ensite clientes.dev.conf
      mkdir /home/vagrant/VBOX/METEORO
      wget -P /etc/apache2/sites-available/ https://raw.githubusercontent.com/meteoro/vagrant-setup/master/apache/clientes.meteoro.conf
      sudo a2ensite clientes.meteoro.conf
      mkdir /home/vagrant/VBOX/NUTS
      wget -P /etc/apache2/sites-available/ https://raw.githubusercontent.com/meteoro/vagrant-setup/master/apache/clientes.nuts.conf
      sudo a2ensite clientes.nuts.conf
      sudo service apache2 restart
    # LANG SSH FIX
      sed -i 's/^AcceptEnv LANG LC_*/# AcceptEnv LANG LC_*/' /etc/ssh/sshd_config
    # SSH FIX
      echo 'LC_ALL="en_US.UTF-8"'  >  /etc/default/locale
    # CHANGE TO ZS
      sudo chsh -s /bin/zsh vagrant
  SHELL
  config.vm.provision "shell", inline: $root, privileged: true

  $user = <<-SHELL
    # NVM
      wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
      . ~/.nvm/nvm.sh && nvm install 5
      nvm alias default v5
      npm install -g grunt-cli gulp bower webpack
    # COMPOSER
      mkdir ~/.local/bin
      wget -qO- http://getcomposer.org/installer | php -- --install-dir=$HOME/.local/bin --filename=composer
    # PHPBREW
      wget -P ~/.local/bin/ https://github.com/phpbrew/phpbrew/raw/master/phpbrew
    # Oh My Zsh
      sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    # Bullet Train Oh My Zsh
      wget -P ~/.oh-my-zsh/themes/ https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
    # SETTINGS
      wget -O ~/.zshrc https://raw.githubusercontent.com/meteoro/vagrant-setup/master/config/.zshrc
      source ~/.zshrc
      wget -O ~/.vimrc https://raw.githubusercontent.com/meteoro/vagrant-setup/master/config/.vimrc
      wget -O ~/.tmux.conf https://raw.githubusercontent.com/meteoro/vagrant-setup/master/config/.tmux.conf
      wget -O ~/.tmuxline.conf https://raw.githubusercontent.com/meteoro/vagrant-setup/master/config/.tmuxline.conf
    # Vim Plug
      wget -P  ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      vim +PlugInstall +qall
      sed -i 's/^" let g:airline_theme="solarized"/let g:airline_theme="solarized"/' ~/.vimrc
      sed -i 's/^" colorscheme solarized/colorscheme solarized/' ~/.vimrc
  SHELL
  config.vm.provision "shell", inline: $user, privileged: false

end
