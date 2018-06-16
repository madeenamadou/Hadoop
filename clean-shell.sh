#!/bin/sh

#  clean-shell.sh
#  
#
#  Created by Youssef de Madeen on 17-04-14.
#

###shell
#clean shell logs
sudo mv /private/var/log/asl/*.asl ~/.Trash


#at install
docker exec -t sandbox /etc/init.d/startup_script start

#at start
ambari-server stop

docker stop sandbox
docker start sandbox
ssh -p 2222 root@localhost
#pass=hadoop

ambari-server restart
ambari-agent restart

chown -R hdfs:hadoop /hadoop
chown -R zookeeper:hadoop /hadoop/zookeeper
chown -R storm:hadoop /hadoop/storm
chown -R mapred:hadoop /hadoop/mapreduce
chown -R yarn:hadoop /hadoop/yarn
chown -R falcon:hadoop /hadoop/falcon/
/etc/init.d/tutorials start
touch /usr/hdp/current/oozie-server/oozie-server/work/Catalina/localhost/oozie/SESSIONS.ser
touch /usr/hdp/current/knox-server/conf/topologies/knox_sample.xml
chown oozie:hadoop /usr/hdp/current/oozie-server/oozie-server/work/Catalina/localhost/oozie/SESSIONS.ser

open -a safari http://localhost:8888

ranger-admin start
ranger-usersync start
su -l hcat -c "/usr/hdp/current/hive-webhcat/sbin/webhcat_server.sh start"
su -l oozie -c "/usr/hdp/current/oozie-server/bin/oozied.sh start"
#yarn timelineserver

#start hive metastore
su - hive -c "nohup /usr/hdp/current/hive-metastore/bin/hive --service metastore -hiveconf hive.log.file=hivemetastore.log >/var/log/hive/hivemetastore.out 2>/var/log/hive/hivemetastoreerr.log &"

#Start Hive Server2.
su - hive
nohup /usr/hdp/current/hive-server2/bin/hiveserver2 -hiveconf hive.metastore.uris=" " -hiveconf hive.log.file=hiveserver2.log >/var/log/hive/hiveserver2.out 2> /var/log/hive/hiveserver2err.log &
#knox gateway
su -l knox -c "/usr/hdp/current/knox-server/bin/gateway.sh start"




#Using Ambari with MySQL
yum install mysql-connector-java


#add sandbox.hortonworks.com to host file
echo '{127.0.0.1} sandbox.hortonworks.com' | sudo tee -a /private/etc/hosts

#SEND DATA BETWEEN SANDBOX & LOCAL MACHINE
scp -P 2222 ~/Downloads/HDF-1.2.0.1-1.tar.gz root@localhost:/root

#restar ambari
ambari-agent restart

#4 different personas fo logging to ambari
#Sam Admin (admin) : Ambari Admin
#Raj (raj_ops) : Hadoop Warehouse Operator ; Hive/Tez, Ranger, Falcon, Knox, Sqoop, Oozie, Flume, Zookeeper
#Maria (maria_dev) : Spark and SQL Developer ; Hive, Zeppelin, MapReduce/Tez/Spark, Pig, Solr, HBase/Phoenix, Sqoop, NiFi, Storm, Kafka, Flume
#Amy (amy_ds) : Data Scientist ; Spark, Hive, R, Python, Scala
#Holger (holger_gov) : Data Steward ; Atlas

#remove
docker rm -f sandbox

docker-machine create --driver=virtualbox default
docker-machine ls
eval "$(docker-machine env default)"
docker load < /Users/youssefamadou/Downloads/HDP_2.5_docker_image_25_10_2016_08_24_31.tar
#install
docker run -v hadoop:/hadoop --name sandbox --hostname "sandbox.hortonworks.com" --privileged -d \
-p 6080:6080 \
-p 9090:9090 \
-p 9000:9000 \
-p 8000:8000 \
-p 8020:8020 \
-p 42111:42111 \
-p 10500:10500 \
-p 16030:16030 \
-p 8042:8042 \
-p 8040:8040 \
-p 2100:2100 \
-p 4200:4200 \
-p 4040:4040 \
-p 8050:8050 \
-p 9996:9996 \
-p 9995:9995 \
-p 8080:8080 \
-p 8088:8088 \
-p 8886:8886 \
-p 8889:8889 \
-p 8443:8443 \
-p 8744:8744 \
-p 8888:8888 \
-p 8188:8188 \
-p 8983:8983 \
-p 1000:1000 \
-p 1100:1100 \
-p 11000:11000 \
-p 10001:10001 \
-p 15000:15000 \
-p 10000:10000 \
-p 8993:8993 \
-p 1988:1988 \
-p 5007:5007 \
-p 50070:50070 \
-p 19888:19888 \
-p 16010:16010 \
-p 50111:50111 \
-p 50075:50075 \
-p 50095:50095 \
-p 18080:18080 \
-p 60000:60000 \
-p 8090:8090 \
-p 8091:8091 \
-p 8005:8005 \
-p 8086:8086 \
-p 8082:8082 \
-p 60080:60080 \
-p 8765:8765 \
-p 5011:5011 \
-p 6001:6001 \
-p 6003:6003 \
-p 6008:6008 \
-p 1220:1220 \
-p 21000:21000 \
-p 6188:6188 \
-p 61888:61888 \
-p 2222:22 \
sandbox /usr/sbin/sshd -D
#change password to container root
ssh -p 2222 root@localhost
#start services
docker exec -t sandbox /etc/init.d/startup_script start

#open interface
open -a safari http://localhost:8888

hdfs://HOSTNAME:9000

scp -P 2222 ~/Downloads/HDF-1.2.0.1-1.tar.gz root@localhost:/root
scp ~/Downloads/hadoop-3.0.0-alpha2.tar.gz root@localhost:/root

docker cp ~/Downloads/hadoop-3.0.0-alpha2.tar e064171956b8:/root

docker exec -t sandbox /etc/init.d/startup_script start
#at start
docker exec -t sandbox make --makefile /usr/lib/hue/tools/start_scripts/start_deps.mf  -B Startup -j -i

docker cp sandbox:/etc/init.d/startup_script ~/Downloads/startup_script1.txt
docker cp sandbox:/usr/lib/hue/tools/start_scripts/start_deps.mf ~/Downloads/start_deps.mf



###container
#ambari server
ambari-server stop
ambari-server start
ambari-server status


#ambari password reset
ambari-admin-password-reset


######

docker run -it ubuntu
docker commit a25ce49bad87 ubuntu:hadoop
docker start 
docker cp ~/Downloads/hadoop-3.0.0-alpha2.tar a25ce49bad87:/root/hadoop
cd root/hadoop/
tar -xf hadoop-3.0.0-alpha2.tar
apt-get install update















