#!/bin/sh

# A simple bash script that creates a virtual host in Apache on Mac
# Usage: sudo sh ./vhost.sh myweb.dev /Users/skala/Developer/Projects/myweb/www

HOSTS=/etc/hosts
HTTPDCONF=/private/etc/apache2/extra/httpd-vhosts.conf

# 2 arguments are required
if [ -o $1 ]
    then
        echo "You have to provide a domain name"
        exit
fi

if [ -o $2 ]
    then
        echo "You have to provide a path"
        exit
fi

# Map domain to localhost in hosts file
echo "127.0.0.1 $1" >> $HOSTS

# Add virtual host to httpd.conf
echo "
<VirtualHost *:80>
    DocumentRoot '$2'
    ServerName $1
</VirtualHost>

<Directory '$2'>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    Allow from all
</Directory>
" >> $HTTPDCONF

echo "$1 mapped to $2"

# Restart Apache
apachectl restart