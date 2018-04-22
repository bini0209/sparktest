sudo apt-get update
sudo apt-get install mysql-server
sudo mysql_secure_installation  or /usr/bin/mysql_secure_installation

sudo iptables -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

sudo service mysql start
sudo /usr/sbin/update-rc.d mysql defaults


/usr/bin/mysql -u root -p


GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY PASSWORD '*EAC4421188CFFD4F87B961C4FAD32EAD31D154C6' WITH GRANT OPTION;<< by this all user can get grant to acess 



#for uninstall mysql
#sudo apt-get remove --purge mysql-server mysql-client mysql-common
#sudo apt-get autoremove
#sudo apt-get autoclean
#sudo rm -rf /var/lib/mysql
#sudo rm -rf /etc/mysql



service mysql stop
killall -KILL mysql mysqld_safe mysqld
apt-get --yes purge mysql-server mysql-client
apt-get --yes autoremove --purge
apt-get autoclean
rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysqld
rm ~/.mysql_history
awk -F : '{ print($6 "/.mysql_history"); }' /etc/passwd | xargs -r -d '\n' -- sudo rm -f --


######copy db

mysqldump --host=192.168.10.5 --port=3306 --user=admin -p etl > [database name].sql


####insert db
 mysql --host=127.0.0.1 --port=3306 --user=root -p etl < [database name].sql
