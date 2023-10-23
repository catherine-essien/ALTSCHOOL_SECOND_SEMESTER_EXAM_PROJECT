#!/bin/bash

# Clone the Laravel repository
git clone https://github.com/laravel/laravel

# Move to the Laravel directory
cd laravel

# Download and install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'EXPECTED_HASH_HERE') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
mv composer.phar /usr/local/bin/composer

# Install PHP dependencies
sudo apt install php-xml curl php-curl zip unzip -y

# Install Laravel project dependencies
composer install

# Rename the .env.example file to .env
cp .env.example .env

# Generate an application key
php artisan key:generate

# Serve the application
php artisan serve

# Check for errors and handle them as needed































# #clone repository
# git clone https://github.com/laravel/laravel

# # ls
# cd laravel

# # installing composer
# sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

# #Verify the installer SHA-384, which you can also cross
# sudo php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# # Run the installer
# sudo php composer-setup.php

# #  composer.phar into a directory on your PATH, so you can simply call composer from any directory (Global install), using for example:
# sudo mv composer.phar /usr/local/bin/composer

# # composer install dependecies
# sudo apt install php-xml curl php-curl zip unzip -y

# # composer install 
# composer install 
# composer update

# # rename your file
# mv env .env

# #generate key
# php artisan key:generate

# #
# php artisan serve
