mkdir /home/etlspark/other_stuff
cd /home/etlspark/other_stuff
echo " downlood cassandra 2.2.9"

wget http://archive.apache.org/dist/cassandra/3.7/apache-cassandra-3.7-bin.tar.gz
# untir cassandra
tar -xzvf apache-cassandra-*-bin.tar.gz




mv -f /home/etlspark/other_part/apache-cassandra-* /home/etlspark/other_part/cassandra

rm apache-cassandra-*-bin.tar.gz

# change authenticator: AllowAllAuthenticator or PasswordAuthenticator
#rpc_address: 192.168.5.5 0r localhost<dont use only acess in local> or 0.0.0.0<acess any where>
# broadcast_rpc_address: 1.2.3.4 <uncomment>
# listen_address <ipaddress by which cassandra can be listen


#echo" changing ownership of scala directory"
#sudo chown -R bizviz:bigdata /usr/local/cassandra

echo " add path properties in ~/.bashrc"
cat >> ~/.bashrc << EOL
#CASSANDR AENC VARIABLES
export CASSANDRA_HOME=/home/etlspark/other_stuff/cassandra
export PATH=$CASSANDRA_HOME/bin:$PATH
EOL
echo " reflect update of .bashrc"
. .bashrc
######################## not required############################
#echo " for single node or standalone cluster we have to create data_file_directories,commitlog_directory,saved_caches_directory,hints_directory"
#mkdir -p /var/lib/cassandra/data
#echo "data_file_directories created"
#mkdir -p /var/lib/cassandra/commitlog
#echo " commitlog_directory created"
#mkdir -p /var/lib/cassandra/saved_caches
#echo "saved_caches_directory created"

echo "Download and  installation of python"

wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz

#untar the python file
tar xzf Python-*.tgz



mv -f /home/etlspark/other_stuff/Python-2.7.13 /home/etlspark/other_stuff/python

rm Python-2.7.13.tgz


#echo" change ownership of python directory"
#sudo chown -R bizviz:bigdata /usr/local/python

echo" add path properties in ~/.bashrc"
cat >> ~/.bashrc << EOL
#------python VARIABLES-----#
export PYTHON_HOME=/home/etlspark/other_stuff/python
EOL
