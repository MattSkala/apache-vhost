Apache VirtualHost Console
==========================
A simple bash script that creates a virtual host in Apache on Mac.

How to use
----------
``sudo sh ./vhost.sh domain path``

(e.g. ``sudo sh ./vhost.sh myweb.dev /Users/skala/Developer/Projects/myweb/www``)

What it does
------------
- Adds a domain mapping to /etc/hosts
- Adds VirtualHost to /private/etc/apache2/extra/httpd-vhosts.conf
- Restarts Apache