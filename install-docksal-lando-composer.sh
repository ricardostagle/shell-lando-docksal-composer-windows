#!/bin/bash 

# Install php and php extensions  to run composer

sudo apt update
sudo apt install php8.22 php-xml php-zip php-gd php-intl php-curl curl wget

# Install composer

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

# Install docksal

DOCKER_NATIVE=1 bash <(curl -fsSL https://get.docksal.io)

# Install lando
wget https://github.com/lando/lando/releases/download/v3.21.0-beta.9/lando-x64-v3.21.0-beta.9.deb
sudo dpkg -i lando-x64-v3.21.0-beta.9.deb

# Install myrepo docksal machines

git clone https://github.com/user/myrepo.git

cd myrepo/

composer install

# Start corvette machines
fin up
fin init

# Let open page in local browser
fin config set --global DOCKSAL_DNS_DOMAIN=docksal.site
fin config set --global DOCKSAL_VHOST_PROXY_IP=127.0.0.1
fin system reset vhost-proxy

# needed to go to hosts filein windows and add mysite.docksal.site after '127.0.0.1 kubernetes.docker.internal ', surely file needs admin permissions

