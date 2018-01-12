#!/bin/bash

echo "  Getting update"
apt-get update && apt-get install utils && apt-get upgrade -y
apt-get install sudo -y
echo "  Install apache2"
apt-get install -f apache2 -y

echo "  Install openssl"
apt-get install -f openssl -y

echo "  Add ServerName localhost"
echo "ServerName localhost" >> /etc/apache2/apache2.conf

echo "  Install wget"
apt-get install -f wget -y

echo "  Install systemd"
apt-get install -f systemd -y

echo "  Install missing packages"
apt-get update && apt-get upgrade

echo "  Downloading server.crt"
wget http://freedownload.veremes.net/products/util/ssl_certificats/server.crt

echo "  Moving server.crt to /etc/ssl/"
mv server.crt /etc/ssl/server.crt

echo "  Downloading server.key"
wget http://freedownload.veremes.net/products/util/ssl_certificats/server.key

echo "  Moving server.key to /etc/ssl/private/"
mv server.key /etc/ssl/private/server.key

echo "  Editing /etc/apache2/sites-available/default-ssl.conf"
old='etc\/ssl\/cert.*$'
new='etc\/ssl\/server\.crt'
sed -i "s/$old/$new/" /etc/apache2/sites-available/default-ssl.conf
old='etc\/ssl\/priv.*$'
new='etc\/ssl\/private\/server\.key'
sed -i "s/$old/$new/" /etc/apache2/sites-available/default-ssl.conf

echo "  Editing /etc/apache2/sites-available/000-default.conf"
# append some text
#old='#ServerName www.example.com*$'
#new="ServerName www\.$HOSTNAME\.com"
#sed -a "s/$old/$new/" /etc/apache2/sites-available/000-default.conf
sed -e "/#ServerName www.example.com*$/ a\ \tServerName www.$HOSTNAME.com \n \tRedirect /https://www.$HOSTNAME.com/" /etc/apache2/sites-available/000-default.conf

echo "  Restarting apache2"
/etc/init.d/apache2 restart

echo "  Activation of a2enmod"
a2enmod ssl

echo "  Restarting service"
service apache2 restart

echo "  Activation of a2ensite"
a2ensite default-ssl.conf

echo "  Reloading service"
service apache2 reload

echo "  Installation of postgresql"
apt-get install -f postgresql postgresql-contrib -y

echo "  Editing /etc/postgres/9.X/main/postgresql.conf"
old="#listen_addresses = 'localhost'"
new="listen_addresses = '*'"
sed -i "s/$old/$new/" /etc/post*/9.*/*/postgresql.conf

echo "  Editing /etc/postgres/9.X/main/pg_hba.conf"
old='local   all             postgres                                peer'
new='local   all             postgres                                trust'
sed -i "s/$old/$new/" /etc/post*/9.*/*/pg_hba.conf

echo "  Restarting postgres"
/etc/init.d/postgresql restart

