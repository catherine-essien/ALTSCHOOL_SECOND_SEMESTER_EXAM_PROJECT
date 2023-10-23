#!/bin/bash

#display the linux type in use
lsb_release -a

# Update package index
sudo apt update

# Install Apache
sudo apt install -y apache2

# Install MySQL and secure installation
sudo apt install -y mysql-server

# Install PHP and required modules
sudo apt install -y php

# Restart Apache
sudo systemctl restart apache2

# Start Apache
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Enable Apache extensions for php
sudo apt install php libapache2-mod-php -y

# enable phpinfo page
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php

# Restart Apache
sudo systemctl restart apache2

echo "LAMP stack installation completed."

# disable the default apache page
echo "disable default apache page"
sudo a2dissite 000-default.conf

# navigate to sites-availble
echo "navigate to sites-availble"
cd /etc/apache2/sites-available

# check directory
echo $(pwd)

# create your site file
echo "catherine.conf"
sudo touch catherine.conf

# update the content
echo "update file"
sudo sed -n 'w catherine.conf' <<EOF
<VirtualHost *:80>
    ServerAdmin admin@admin.com
    ServerName catherine.local

    DocumentRoot /var/www/catherine/public

    <Directory /var/www/catherine/public>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/catherine-error.log
    CustomLog \${APACHE_LOG_DIR}/catherine-access.log combined

    <IfModule mod_dir.c>
        DirectoryIndex index.php
    </IfModule>
</VirtualHost>
EOF


# enable the site
echo "catherine"
sudo a2ensite catherine

# create the site directory
echo "create site directory"
sudo mkdir -p /var/www/catherine

# copy the content to site directory
cd
echo $(pwd)
sudo cp -R laravel/. /var/www/catherine/

# go back to the directory
cd /var/www/catherine
echo $(pwd)

# set permission for the files
echo "grant permission to files"
sudo chown -R vagrant:www-data /var/www/catherine/
sudo find /var/www/catherine/ -type f -exec chmod 664 {} \;
sudo find /var/www/catherine/ -type d -exec chmod 775 {} \;
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

# reload apache
sudo systemctl reload apache2

# done
echo 'webserver is up vist http://127.0.0.1 to view website'