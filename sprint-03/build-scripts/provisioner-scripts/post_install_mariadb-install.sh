#!/bin/bash 
set -e
set -v

sudo apt-get update
sudo apt-get install -y mariadb-server 

# Enable the service 
sudo systemctl enable mariadb.service

# Inject the username and password for autologin later in a ~/.my.cnf file
# http://serverfault.com/questions/103412/how-to-change-my-mysql-root-password-back-to-empty/103423#103423
# https://stackoverflow.com/questions/8020297/mysql-my-cnf-file-found-option-without-preceding-group

echo -e "[mysqld]" > /root/.my.cnf
echo -e "\n\n[client]\nuser = root\npassword = $DBPASS" >> /root/.my.cnf
echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /root/.my.cnf

echo -e "[mysqld]" > /home/vagrant/.my.cnf.user
echo -e "\n\n[client]\nuser = worker\npassword = $USERPASS" >> /home/vagrant/.my.cnf.user
echo -e "\nport = 3306\nsocket = /var/run/mysqld/mysqld.sock\n" >> /home/vagrant/.my.cnf.user
echo -e "\ndefault-character-set = utf8mb4\n" >> /home/vagrant/.my.cnf.user

# Set system hostname
sudo hostnamectl set-hostname backend-server

# https://stackoverflow.com/questions/8055694/how-to-execute-a-mysql-command-from-a-shell-script
# This section uses the user environment variables declared in packer json build template
# #USERPASS and $BKPASS

# chown the cloned github repo files so the user owns it 
###############################################################################
# Replace any occurance of 2021-team-sample with the name of your own team private repository #
###############################################################################

sudo chown -R vagrant:vagrant ~/2021-team09r

# Using sed to replace variables in the scripts with the ENV variables passed
sed -i "s/\$ACCESSFROMIP/$ACCESSFROMIP/g" ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/*.sql
sed -i "s/\$USERPASS/$USERPASS/g" ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/*.sql

sed -i "s/\$HOST/192.168.33.34/g" /home/vagrant/2021-team09r/sprint-03/code/ReactMultiPageWebsite/.env
sed -i "s/\$USER/worker/g" /home/vagrant/2021-team09r/sprint-03/code/ReactMultiPageWebsite/.env
sed -i "s/\$DATABASE/books/g" /home/vagrant/2021-team09r/sprint-03/code/ReactMultiPageWebsite/.env
sed -i "s/\$PASSWORD/userpass/g" /home/vagrant/2021-team09r/sprint-03/code/ReactMultiPageWebsite/.env


# This script will create the database named posts in the mariadb server
sudo mysql -u root < ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/create-database.sql
# This script will create the table named comments
sudo mysql -u root < ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/create-table.sql
# This script will insert 3 sample records to the table
sudo mysql -u root < ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/insert-records.sql

sudo mysql -u root < ~/2021-team09r/sprint-03/code/ReactMultiPageWebsite/data/create-user-with-permissions-mm.sql

# Enable Firewall
# https://serverfault.com/questions/809643/how-do-i-use-ufw-to-open-ports-on-ipv4-only
# DBIP is configured in the packer environment variables to allow access from a variable IP
# https://serverfault.com/questions/790143/ufw-enable-requires-y-prompt-how-to-automate-with-bash-script
ufw --force enable
ufw allow proto tcp to 0.0.0.0/0 port 22
# For nodejs app default port
ufw allow from 192.168.33.33
ufw allow 3000
ufw allow from $FIREWALLACCESS to any port 3306
