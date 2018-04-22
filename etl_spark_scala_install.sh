echo "creat etlspark user"
sudo adduser -ingroup bigdata etlspark
echo "first we have to download scala 2.10.4"
mkdir etl
cd /home/etlspark/etl/
 
wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz

echo "untar scala"
tar -xvzf scala*.tgz
echo "make a directory in /home/etlspark/scala"



mv scala-2.11.8 scala
#chown -R etlspark:bigdata /home/etlspark/etl/scala


rm scala-2.11.8.tgz

echo " add path properties in .bashrc file"
cat >> ~/.bashrc << EOL
#---scala variables---#
export SCALA_HOME=/home/etlspark/etl/scala
export PATH=$SCALA_HOME/bin:$PATH
EOL
echo"refresh or reflact bashrc update"
. .bashrc
# source ~/.bashrc
echo " spark installation process start"
 
echo " download spark-2.0.0-bin-hadoop2.4.tgz file "
wget http://archive.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.4.tgz

tar -xvzf spark*.tgz

mv spark-2.0.0-bin-hadoop2.4 spark 

rm spark-2.0.0-bin-hadoop2.4.tgz

mkdir /home/etlspark/etl/logs
mkdir /home/etlspark/etl/jars

cd /home/etlspark/etl/spark/conf
#cp slaves.template slaves

mkdir /home/etlspark/etl/bin


# Now copy the jar into the jars directory

#mkdir /home/etlspark/etl/build

# Make sure cassandra and elastic is installed and started in the machine


# make sure to start spark in cluster mode before submit


