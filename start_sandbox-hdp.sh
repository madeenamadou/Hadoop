#!/bin/bash
echo "Waiting for docker daemon to start up:"
until docker ps 2>&1| grep STATUS>/dev/null; do  sleep 1; done;  >/dev/null
docker ps -a | grep sandbox
if [ $? -eq 0 ]; then
 docker start sandbox
else
docker run --name sandbox --hostname "sandbox.hortonworks.com" --privileged -d \

docker run --name sandbox --hostname "localhost" --privileged -d \
-p 1111:111 \
-p 1000:1000 \
-p 1100:1100 \
-p 1220:1220 \
-p 1988:1988 \
-p 2049:2049 \
-p 2100:2100 \
-p 2181:2181 \
-p 3000:3000 \
-p 4040:4040 \
-p 4200:4200 \
-p 4242:4242 \
-p 5007:5007 \
-p 5011:5011 \
-p 6001:6001 \
-p 6003:6003 \
-p 6008:6008 \
-p 6080:6080 \
-p 6188:6188 \
-p 8000:8000 \
-p 8005:8005 \
-p 8020:8020 \
-p 8032:8032 \
-p 8040:8040 \
-p 8042:8042 \
-p 8080:8080 \
-p 8082:8082 \
-p 8086:8086 \
-p 8088:8088 \
-p 8090:8090 \
-p 8091:8091 \
-p 8188:8188 \
-p 8443:8443 \
-p 8744:8744 \
-p 8765:8765 \
-p 8886:8886 \
-p 8888:8888 \
-p 8889:8889 \
-p 8983:8983 \
-p 8993:8993 \
-p 9000:9000 \
-p 9995:9995 \
-p 9996:9996 \
-p 10000:10000 \
-p 10001:10001 \
-p 10015:10015 \
-p 10016:10016 \
-p 10500:10500 \
-p 10502:10502 \
-p 11000:11000 \
-p 15000:15000 \
-p 15002:15002 \
-p 16000:16000 \
-p 16010:16010 \
-p 16020:16020 \
-p 16030:16030 \
-p 18080:18080 \
-p 18081:18081 \
-p 19888:19888 \
-p 21000:21000 \
-p 33553:33553 \
-p 39419:39419 \
-p 42111:42111 \
-p 50070:50070 \
-p 50075:50075 \
-p 50079:50079 \
-p 50095:50095 \
-p 50111:50111 \
-p 60000:60000 \
-p 60080:60080 \
-p 15500:15500 \
-p 15501:15501 \
-p 15502:15502 \
-p 15503:15503 \
-p 15504:15504 \
-p 15505:15505 \
-p 2222:22 \
7c0e04af89fc /usr/sbin/sshd -D
sandbox /usr/sbin/sshd -D
fi
#docker run --name hadoop --hostname "localhost" --privileged -d \
#sequenceiq/hadoop-docker /usr/sbin/sshd -D



docker run --name cloudera --hostname "quickstart.cloudera" --privileged=true -t -i \
-p 1111:111 \
-p 1000:1000 \
-p 1100:1100 \
-p 1220:1220 \
-p 1988:1988 \
-p 2049:2049 \
-p 2100:2100 \
-p 2181:2181 \
-p 3000:3000 \
-p 4040:4040 \
-p 4200:4200 \
-p 4242:4242 \
-p 5007:5007 \
-p 5011:5011 \
-p 6001:6001 \
-p 6003:6003 \
-p 6008:6008 \
-p 6080:6080 \
-p 6188:6188 \
-p 8000:8000 \
-p 8005:8005 \
-p 8020:8020 \
-p 8032:8032 \
-p 8040:8040 \
-p 8042:8042 \
-p 8080:8080 \
-p 8082:8082 \
-p 8086:8086 \
-p 8088:8088 \
-p 8090:8090 \
-p 8091:8091 \
-p 8188:8188 \
-p 8443:8443 \
-p 8744:8744 \
-p 8765:8765 \
-p 8886:8886 \
-p 8888:8888 \
-p 8889:8889 \
-p 8983:8983 \
-p 8993:8993 \
-p 9000:9000 \
-p 9995:9995 \
-p 9996:9996 \
-p 10000:10000 \
-p 10001:10001 \
-p 10015:10015 \
-p 10016:10016 \
-p 10500:10500 \
-p 10502:10502 \
-p 11000:11000 \
-p 15000:15000 \
-p 15002:15002 \
-p 16000:16000 \
-p 16010:16010 \
-p 16020:16020 \
-p 16030:16030 \
-p 18080:18080 \
-p 18081:18081 \
-p 19888:19888 \
-p 21000:21000 \
-p 33553:33553 \
-p 39419:39419 \
-p 42111:42111 \
-p 50070:50070 \
-p 50075:50075 \
-p 50079:50079 \
-p 50095:50095 \
-p 50111:50111 \
-p 60000:60000 \
-p 60080:60080 \
-p 15500:15500 \
-p 15501:15501 \
-p 15502:15502 \
-p 15503:15503 \
-p 15504:15504 \
-p 15505:15505 \
-p 2222:22 \
-p 7180:7180 \
-p 3306:3306 \
cloudera/quickstart /usr/bin/docker-quickstart -D



#kill ajob
hadoop job -list
hadoop job -kill $jobId

for daemon in ${DAEMONS}; do
    sudo service ${daemon} start
done

zookeeper-server \
        hadoop-hdfs-datanode \
        hadoop-hdfs-journalnode 

DAEMONS="cloudera-scm-server-db \
        cloudera-scb-server \
        cloudera-scm-server-db"

/var/lib/hadoop-hdfs/
/var/lib/hadoop-hdfs/

-e /var/lib/cloudera-quickstart/.cloudera-manager

/usr/lib/hadoop/usr/java/jdk1.7.0_67-cloudera/bin/java

/usr/lib/hadoop-yarn/usr/java/jdk1.7.0_67-cloudera/bin/java
mysqld \
cloudera-quickstart-init

        cloudera-scm-server-db \
        cloudera-scb-server \
        cloudera-scm-server-db"
#hadoop history server dont start

            METADATA_API=http://169.254.169.254/latest/meta-data
            KEY_URL=${METADATA_API}/public-keys/0/openssh-key
            SSH_DIR=/home/cloudera/.ssh
            mkdir -p ${SSH_DIR}
            chown cloudera:cloudera ${SSH_DIR}
            curl ${KEY_URL} >> ${SSH_DIR}/authorized_keys
            touch ${FIRST_BOOT_FLAG}

export HOSTNAME=7e4f8c4c7947
export HADOOP_HOST_NAMENODE=7e4f8c4c7947

export JAVA_HOME=/usr/java/jdk1.7.0_67-cloudera
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_CONF_DIR=/etc/hadoop/conf.pseudo
export HADOOP_MAPRED_HOME=/usr/lib/hadoop-mapreduce

#add to ./usr/lib/hadoop/etc/hadoop/hadoop-env.sh

export PATH=$PATH:/usr/java/jdk1.7.0_67-cloudera/bin:/usr/lib/hadoop/bin:/usr/lib/hadoop/sbin
chmod +x /usr/lib/hadoop/etc/hadoop/*.sh
chmod +x /usr/lib/hadoop/sbin/*.sh
$HADOOP_HOME/etc/hadoop/hadoop-env.sh

#goto ./usr/lib/hadoop/etc/hadoop
#add localhost to core-site
sed s/quickstart.cloudera/$HOSTNAME/ $HADOOP_HOME/etc/hadoop/core-site.xml > $HADOOP_HOME/etc/hadoop/core-site.xml

yum -y install nano openssh-server
service sshd start


add to mapred-site
  <property>
    <name>mapreduce.job.ubertask.enable</name>
    <value>false</value>
  </property>
 and set hostname to 0.0.0.0 everywhere
 
 in hdfs-site and core-site
 replace all hostname by 0.0.0.0 

sudo /home/cloudera/cloudera-manager --express



check config  /etc/zookeeper/conf/zoo.cfg

rm -f /root/.ssh/id_rsa && \
	ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa && \
	cp /root/.ssh/id_rsa.pub ~/.ssh/authorized_keys && \
	chmod 640 ~/.ssh/authorized_keys && \
	chmod 700 ~/.ssh

rm -f /etc/ssh/ssh_host_rsa_key
rm -f /etc/ssh/ssh_host_dsa_key

ssh-keygen -t rsa -P '' -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t dsa -P '' -f /etc/ssh/ssh_host_dsa_key

# alterations aux configurations sshd
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN echo "AllowUsers root" >> /etc/ssh/sshd_config


yarn nodemanager start

		service hadoop-historyserver start
        service hbase-master stop
        service hbase-rest stop
        service hbase-thrift stop
        service hive-metastore stop
        service hive-server2 stop
        service sqoop2-server stop
        service spark-history-server stop
        service hbase-regionserver stop
        service hue stop
		service impala-state-store stop
        service oozie stop
        service solr-server stop
        service impala-catalog stop
        service impala-server stop
        
kafka-server ??
0.0.0.0
./usr/lib/hadoop-yarn/sbin/yarn-daemon.sh
./usr/lib/hadoop-0.20-mapreduce/
./usr/lib/hadoop/

# sqoop job : import db tables from to hive
sqoop import-all-tables \
    -m 1 \
    --connect jdbc:mysql://quickstart.cloudera:3306/retail_db \
    --username=root \
    --password= \
    --compression-codec=snappy \
    --as-parquetfile \
    --warehouse-dir=/user/hive/warehouse \
    --hive-import

test

sudo -u hdfs hadoop jar \
./usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar \
pi 10 100


sudo -u root hadoop jar /usr/jars/hadoop-mapreduce-examples-2.6.0-cdh5.7.0.jar wordcount /user/root/7mots.txt /user/root/7mots.result

docker run -it --name hadoop \
    -v ~/tmp/hadoop_image/logs:/opt/hadoop/logs \
    -v ~/tmp/hadoop_image/shared:/root/shared \
    -p 49707:49707 -p 8031:8031 -p 8032:8032 -p 8033:8033 \
    -p 8040:8040 -p 8030:8030 -p 8080:8080 -p 8888:8888 \
    -p 11000:11000 -p 10001:10001 -p 15000:15000 -p 10000:10000 \
    -p 50070:50070 -p 50075:50075 -p 50090:50090 -p 50020:50020 \
    -p 50010:50010 -p 2222:22 -p 8042:8042 -p 8088:8088 \
    -d sequenceiq/hadoop-docker

3e134ce380ab
ssh root@127.0.0.1 -p 2222
password=nawal002


$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode
$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode
$HADOOP_HOME/sbin/hadoop-daemon.sh start secondarynamenode
$HADOOP_HOME/sbin/yarn-daemon.sh start resourcemanager
$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager


source start_ambari.sh
./usr/hdp/2.5.0.0-1245/hadoop-yarn/sbin/yarn-daemon.sh start resourcemanager
./usr/hdp/2.5.0.0-1245/hadoop-yarn/sbin/yarn-daemon.sh start nodemanager
./usr/hdp/2.5.0.0-1245/hadoop/sbin/hadoop-daemon.sh start namenode
./usr/hdp/2.5.0.0-1245/hadoop/sbin/hadoop-daemon.sh start datanode
./usr/hdp/2.5.0.0-1245/hadoop/sbin/hadoop-daemon.sh start secondarynamenode

ambari-admin-password-reset
service postgresql start
service mysqld start

ifconfig #look for inet address

chown -R mysql:mysql /var/lib/mysql
chmod 755 -R /var/lib/mysql/
sudo yum -y install mysql-server
sudo yum -y install mysql-connector-java
chmod 644 /usr/share/java/mysql-connector-java-5.1.17.jar


service mysqld restart
sudo chkconfig mysqld on
curl http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.5.2.0/ambari.repo --output /etc/yum.repos.d/ambari.repo
yum -y install ambari-server ambari-agent

mysql -u root -p 

CREATE USER 'madeen_dev'@'%' IDENTIFIED BY 'madeen_dev';
GRANT ALL PRIVILEGES ON *.* TO 'madeen_dev'@'%';
CREATE USER 'madeen_dev'@'localhost' IDENTIFIED BY 'madeen_dev';
GRANT ALL PRIVILEGES ON *.* TO 'madeen_dev'@'localhost';
CREATE USER 'madeen_dev'@'aa722d6a4223' IDENTIFIED BY 'madeen_dev';
GRANT ALL PRIVILEGES ON *.* TO 'madeen_dev'@'aa722d6a4223';
FLUSH PRIVILEGES;

#SHOW GRANTS FOR 'madeen_dev'@'aa722d6a4223';

#Before starting Ambari Server, you must run the following DDL against the database to create the schema: 
#/var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql

update user set password=password('') where user="root" and host="quickstart.cloudera";

cd /var/lib/ambari-server/resources/
mysql -u madeen_dev -p
CREATE DATABASE ambari;
USE ambari;
SOURCE Ambari-DDL-MySQL-CREATE.sql;

#create hive, oozie mysql databases


ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java.jar –j /usr/java/default
ambari-server start
ambari-agent start

source /usr/local/hadoop/sbin/stop-all.sh
/usr/local/hadoop/sbin/stop-yarn.sh
/usr/local/hadoop/sbin/stop-dfs.sh

yum -y install ntp
service ntpd start
sudo chkconfig ntpd on
sudo chkconfig mysqld on


/usr/java/default

$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start secondarynamenode
$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager
$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager

docker exec -t sandbox /bin/sh -c 'chown -R mysql:mysql /var/lib/mysql'
#chmod 755 -R /var/lib/mysql/
docker exec -d sandbox service mysqld start
docker exec -d sandbox service postgresql start
docker exec -t sandbox ambari-server start
docker exec -t sandbox ambari-agent start #
docker exec -t sandbox /bin/sh -c 'rm -f /usr/hdp/current/oozie-server/libext/falcon-oozie-el-extension-0.10.0.2.6.1.0-129.jar'
docker exec -t sandbox /bin/sh -c 'chown -R hdfs:hadoop /hadoop/hdfs'

echo "Waiting for ambari agent to connect"
docker exec -t sandbox /bin/sh -c ' until curl --silent -u admin:4o12t0n -H "X-Requested-By:ambari" -i -X GET  http://localhost:8080/api/v1/clusters/Sandbox/hosts/sandbox.hortonworks.com/host_components/ZOOKEEPER_SERVER | grep state | grep -v desired | grep INSTALLED; do sleep 5; echo -n .; done;'

echo "Waiting for ambari services to start "
docker exec -t sandbox /bin/sh -c 'until curl --silent --user admin:4o12t0n -X PUT -H "X-Requested-By: ambari"  -d "{\"RequestInfo\":{\"context\":\"_PARSE_.START.HDFS\",\"operation_level\":{\"level\":\"SERVICE\",\"cluster_name\":\"Sandbox\",\"service_name\":\"HDFS\"}},\"Body\":{\"ServiceInfo\":{\"state\":\"STARTED\"}}}" http://localhost:8080/api/v1/clusters/Sandbox/services/HDFS | grep -i accept >/dev/null; do echo -n .; sleep 5; done;'

docker exec -t sandbox /bin/sh -c 'until curl --silent --user admin:4o12t0n -X PUT -H "X-Requested-By: ambari"  -d "{\"RequestInfo\":{\"context\":\"_PARSE_.START.ALL_SERVICES\",\"operation_level\":{\"level\":\"CLUSTER\",\"cluster_name\":\"Sandbox\"}},\"Body\":{\"ServiceInfo\":{\"state\":\"STARTED\"}}}" http://localhost:8080/api/v1/clusters/Sandbox/services | grep -i accept > /dev/null; do sleep 5; echo -n .; done; '

docker exec -t sandbox /bin/sh -c 'until /usr/bin/curl --silent --user admin:4o12t0n -H "X-Requested-By: ambari" "http://localhost:8080/api/v1/clusters/Sandbox/requests?to=end&page_size=10&fields=Requests" | tail -n 27 | grep COMPLETED | grep COMPLETED > /dev/null; do echo -n .; sleep 1; done;'

docker exec -t sandbox su - hue -c '/bin/bash /usr/lib/tutorials/tutorials_app/run/run.sh &>/dev/null'
docker exec -t sandbox su - hue -c '/bin/bash /usr/lib/hue/tools/start_scripts/update-tutorials.sh &>/dev/null'
docker exec -t sandbox touch /usr/hdp/current/oozie-server/oozie-server/work/Catalina/localhost/oozie/SESSIONS.ser
docker exec -t sandbox chown oozie:hadoop /usr/hdp/current/oozie-server/oozie-server/work/Catalina/localhost/oozie/SESSIONS.ser
docker exec -d sandbox /etc/init.d/tutorials start
docker exec -d sandbox /etc/init.d/splash
docker exec -d sandbox /etc/init.d/shellinaboxd start


#cd /etc/yum.repos.d
#mv sandbox.repo /tmp
#mv /tmp/sandbox.repo .
#ranger issue
#yum install ranger-admin
#yum install ranger-usersync
#yum install ranger-hdfs-plugin
#yum install ranger-hive-plugin
#set JAVA_HOME
#start timelineserver yarn timelineserver



DAEMONS="
zookeeper-server \
hadoop-hdfs-datanode \
hadoop-hdfs-journalnode \
hadoop-hdfs-namenode \
hadoop-hdfs-secondarynamenode \
hadoop-httpfs \
hadoop-mapreduce-historyserver \
hadoop-yarn-nodemanager \
hadoop-yarn-resourcemanager \
hbase-master \
hbase-rest \
hbase-thrift \
hive-metastore \
hive-server2 \
sqoop2-server \
spark-history-server \
hbase-regionserver \
hue \
impala-state-store \
oozie \
solr-server \
impala-catalog \
impala-server"
fi

for daemon in ${DAEMONS}; do
    sudo service ${daemon} stop
done





