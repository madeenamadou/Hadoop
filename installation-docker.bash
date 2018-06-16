######
##


#load ubuntu image to docker
docker pull ubuntu
#start the ubuntu container
docker run -it -d --name="hadoop" ubuntu
#docker attach hadoop

alias hdp='docker ps -a -q --filter "name=hadoop"'
docker start `hdp`
docker stop `hdp`
#docker rm  $(docker ps -a)
docker exec -it `hdp` /bin/bash

#c0dff0189ffb

#save and return to your work
docker commit `hdp` ubuntu:hadoop

#downlaod hadoop image (*.tar file) and copy to ubuntu container
docker exec -it `hdp` mkdir root/hadoop
docker cp Downloads/hadoop-2.7.3.tar hadoop:root/hadoop/
#extract the hadoop tar file
cd /root/hadoop/
tar -xf hadoop-2.7.3.tar


#docker cp hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hadoop-env.sh ./Downloads/hadoop/


#install jdk 7 (open jdk) ; source : http://openjdk.java.net/install/
#update list of packages
docker exec -it `hdp` apt-get update
#docker exec -it `hdp` apt-cache search jdk
docker exec -it `hdp` apt-get install openjdk-8-jdk

#JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
#HADOOP
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
export HADOOP_HOME=/root/hadoop/hadoop-2.7.3
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export HIVE_HOME=/root/hive/apache-hive-1.2.2-bin
export PATH=$PATH:/root/hive/apache-hive-1.2.2-bin/bin

#config hadoop-env.sh
docker cp ./Downloads/hadoop/tmp/hadoop-env.sh hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hadoop-env.sh
docker exec -it `hdp` source root/hadoop/hadoop-2.7.3/etc/hadoop/hadoop-env.sh



#export YARN_HOME=/root/hadoop/hadoop-2.7.3
#export HADOOP_MAPRED_HOME=/root/hadoop/hadoop-2.7.3
#export HADOOP_COMMON_HOME=/root/hadoop/hadoop-2.7.3
#export HADOOP_HDFS_HOME=/root/hadoop/hadoop-2.7.3
#root/hadoop/hadoop-2.7.3/etc/hadoop/hadoop-env.sh
#docker cp hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hadoop-env.sh ./Downloads/hadoop/tmp/


#config hadoop core-site.xml
docker cp ./Downloads/hadoop/tmp/core-site.xml hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/core-site.xml
#docker cp hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/core-site.xml ./Downloads/hadoop/tmp/

#general update file
#docker cp hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hdfs-site.xml ./Downloads/hadoop/tmp/
#docker cp ./Downloads/hadoop/tmp/hdfs-site.xml hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hdfs-site.xml

#config hdfs-site.xml
#create dirs
docker exec -it `hdp` mkdir -p /home/admin/Hadoop/Hadoop3_data/NameNode/
docker exec -it `hdp` mkdir -p /home/admin/Hadoop/Hadoop3_data/DataNode/
docker cp ./Downloads/hadoop/tmp/hdfs-site.xml hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hdfs-site.xml
#docker cp hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/hdfs-site.xml ./Downloads/hadoop/tmp/




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


#centos
yum -y --enablerepo=extras install epel-release && \
yum update && \
yum -y install openssh-server openssh-client sudo nano rsync sshd curl

useradd -G users -m youssef

ssh-keygen -t rsa -P '' -f $HOME/.ssh/id_rsa && \
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys && \
chmod 600 $HOME/.ssh/authorized_keys && \
chmod 700 $HOME/.ssh

nano /etc/ssh/sshd_config
#Port 2222
#AllowUsers root
echo "AllowUsers root" >> /etc/ssh/sshd_config
systemctl enable sshd.service


yum install java-1.8.0-openjdk

tar  -xz -C /usr/java/default
http://ftp.heanet.ie/mirrors/funtoo/distfiles/oracle-java/

#debian/ubuntu
apt-get update && \
apt-get -y install openssh-server openssh-client sudo nano curl

useradd -G users -m youssef

ssh-keygen -t rsa -P '' -f $HOME/.ssh/id_rsa && \
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys && \
chmod 600 $HOME/.ssh/authorized_keys && \
chmod 700 $HOME/.ssh

echo "AllowUsers root" >> /etc/ssh/sshd_config
service ssh restart
ssh -p 22 root@$HOSTNAME
#nano /etc/ssh/sshd_config


curl -s http://ftp.heanet.ie/mirrors/funtoo/distfiles/oracle-java/jdk-7u76-linux-x64.tar.gz | tar --strip-components=1 -xz -C /usr/java/default/




curl -s http://ftp.heanet.ie/mirrors/funtoo/distfiles/oracle-java/jdk-8u112-linux-x64.tar.gz | tar --strip-components=1 -xz -C /usr/java/default/

curl -LJO https://github.com/madeenamadou/R-Hadoop/blob/master/Wordcount/wordcount.r


wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
http://download.oracle.com/otn-pub/java/jdk/8-b132/jdk-8-linux-x64.tar.gz \
-O jdk-8-linux-x64.tar.gz



wget --no-cookies --no-check-certificate --header \
"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "https://edelivery.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz"

curl -Ls 'https://edelivery.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz' -H 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com' | \
tar --strip-components=1 -xz -C /usr/java/default/


wget --no-cookies --no-check-certificate --header \
"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "https://edelivery.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz"
tar -xz jdk-7u80-linux-x64.tar.gz -C /usr/java/default/
mv jdk-7u80-linux-x64/* /usr/java/default/

useradd -G hadoop hduser

ssh hduser@192.168.99.100
ssh -p 2222 root@56b197bee686

#grep hadoop /etc/group
useradd -G hadoop yarn
useradd -G hadoop hdfs
useradd -G hadoop mapred


chown -R hdfs:hadoop /hadoop
chown -R yarn:hadoop /hadoop/yarn
chown -R mapred:hadoop /hadoop/mapreduce

su - hduser

ssh-keygen -t rsa -P '' -f $HOME/.ssh/id_rsa && \
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys && \
chmod 600 $HOME/.ssh/authorized_keys && \
chmod 700 $HOME/.ssh && \
chown hduser:hadoop $HOME/.ssh/authorized_keys

chown hduser:hadoop -R /etc/ssh/sshd_config



chown hduser:hadoop /etc/ssh/sshd_config


## SED MANIP
sed -i "/^[^#]*PubkeyAuthentication/ s/.*/#&/"  /etc/ssh/sshd_config




# supprimer un # (activer une ligne desactivee)
sed -i "/[^#]*export HIVE_CONF_DIR=*/ s/..//" hive-env
sed -i "/^export HIVE_CONF_DIR*/ s/.*/export HIVE_CONF_DIR=\/usr\/local\/hive\/conf/" hive-env
sed -i "/[^#]*export HADOOP_HEAPSIZE*/ s/..//" hive-env
echo "export HIVE_HOME=/usr/local/hive" >> hive-env
echo "export PATH=\$PATH:\$HIVE_HOME/bin" >> hive-env
sed -i "/[^#]*HADOOP_HOME*/ s/..//" hive-env
sed -i "/^HADOOP_HOME=*/ s/.*/HADOOP_HOME=\$HADOOP_PREFIX/" hive-env

# HADOOP_HOME=${bin}/../../hadoop

#configure SSH access to localhost for the hduser user we created in the previous section.

#ssh config
#debian os
docker exec -it `hdp` apt-get install ssh
docker exec -it `hdp` apt-get install pdsh

#non debian os
docker exec -it `hdp` apt-get install openssh-server
docker exec -it `hdp` ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

#Copy the public key from .ssh directory to authorized_keys folder.
#Change the directory to .ssh and then type the below command to copy the files
#into the authorized _keys folder.
docker exec -it `hdp` cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

#To ensure whether the keys have been copied, type the command:
docker exec -it `hdp` cat authorized_keys

#Change the permission of the .ssh directory.
docker exec -it `hdp` chmod 600 ~/.ssh/authorized_keys

docker exec -it `hdp` apt-get update
docker exec -it `hdp` rpm -Uvh http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari-1.x-1.el6.noarch.rpm
docker exec -it `hdp` apt-get install pdsh

#copy the ssh file into pdsh
echo "ssh" > /etc/pdsh/rcmd_default

#rsync
apt-get install rsync

#config mapred-site.xml
docker exec -it `hdp` mv root/hadoop/hadoop-2.7.3/etc/hadoop/mapred-site.xml.template root/hadoop/hadoop-2.7.3/etc/hadoop/mapred-site.xml
docker cp ./Downloads/hadoop/tmp/mapred-site.xml hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/mapred-site.xml

#config yarn-site.xml
docker cp ./Downloads/hadoop/tmp/yarn-site.xml hadoop:root/hadoop/hadoop-2.7.3/etc/hadoop/yarn-site.xml


#bash.bashrc
export HADOOP_HOME=/root/hadoop/hadoop-2.7.3
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin

docker cp ./Downloads/hadoop/tmp/bash.bashrc f0387dfaaf16:etc/bash.bashrc
docker cp ./Downloads/hadoop/tmp/bash0.bashrc 89e253a065ce:root/.bashrc
source /etc/bash.bashrc
source /root/.bashrc

#formatting the namenode
docker exec -it `hdp` $HADOOP_HOME/bin/hdfs namenode -format

#start hadoop daemons
#Starting HDFS daemons
#Starting name node
docker exec -it `hdp` $HADOOP_HOME/sbin/hadoop-daemon.sh start namenode
#to show the currently running java virtual machine process

#Starting datanode
docker exec -it `hdp` $HADOOP_HOME/sbin/hadoop-daemon.sh start datanode

#Starting secondary namenode
docker exec -it `hdp` $HADOOP_HOME/sbin/hadoop-daemon.sh start secondarynamenode

#Starting YARN daemons
docker exec -it `hdp` $HADOOP_HOME/sbin/yarn-daemon.sh start resourcemanager

#Starting Node Manager
docker exec -it `hdp` $HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager

#can start all daemons with
source $HADOOP_HOME/sbin/start-all.sh


$HADOOP_HOME/bin/hdfs dfs -mkdir /usr/local/files
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /usr/local/files



docker commit `hdp` ubuntu:hadoop



#install hive
#HIVE
docker exec -it `hdp` mkdir root/hive/
docker exec -it `hdp` wget http://archive.apache.org/dist/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz
docker exec -it `hdp` mv apache-hive-1.2.2-bin.tar.gz /root/hive/
cd /root/hive/
tar -xzf apache-hive-1.2.2-bin.tar.gz

#HIVE
export HIVE_HOME=/root/hive/apache-hive-1.2.2-bin
export PATH=$PATH:/root/hive/apache-hive-1.2.2-bin/bin

#create hive dirs
hdfs dfs -mkdir -p /usr/local/files/
hdfs dfs -mkdir -p /tmp
#add permission r/w
hdfs dfs -chmod g+w /usr/local/hive/warehouse
hdfs dfs -chmod g+w /tmp

#config hive-env.sh
docker exec -it `hdp` mv /root/hive/apache-hive-1.2.2-bin/conf/hive-env.sh.template /root/hive/apache-hive-1.2.2-bin/conf/hive-env.sh
docker cp ./Downloads/hadoop/tmp/hive-env2.sh 87f5c1d03f5d:usr/local/hive/conf/hive-env.sh
docker cp 87f5c1d03f5d:usr/local/hive/conf/hive-env.sh ./Downloads/hadoop/tmp/hive-env2.sh
source /root/hive/apache-hive-1.2.2-bin/conf/hive-env.sh

#config hive-site.xml
docker exec -it `hdp` mv /root/hive/apache-hive-1.2.2-bin/conf/hive-default.xml.template /root/hive/apache-hive-1.2.2-bin/conf/hive-default.xml
#docker cp hadoop:root/hive/apache-hive-1.2.2-bin/conf/hive-default.xml ./Downloads/hadoop/tmp/
#docker cp ./Downloads/hadoop/tmp/hive-site.xml hadoop:root/hive/apache-hive-1.2.2-bin/conf/hive-site.xml



#Initialize Derby database
$HIVE_HOME/bin/schematool -initSchema -dbType derby

#start
$HIVE_HOME/bin/hive

#Hcatalog
$HIVE_HOME/hcatalog/sbin/hcat_server.sh

#hiveserver2
$HIVE_HOME/bin/hiveserver2

$HIVE_HOME/bin/beeline -u jdbc:hive2://$HS2_HOST:$HS2_PORT

#$HIVE_HOME/bin/beeline -u jdbc:hive2://

#webhcat
$HIVE_HOME/hcatalog/sbin/webhcat_server.sh

#set local mode one map.reducer
hive> SET mapreduce.framework.name=local;


docker commit 87f5c1d03f5d hadoop:v1


#mysql
apt-get install mysql-server
apt-get install libmysql-java
ln -s /usr/share/java/mysql-connector-java.jar $HIVE_HOME/lib/mysql-connector-java.jar
mysql -u root -p


docker run -it hadoop:v1


######starting process

#In Docker Cloud, you can define one or more data volumes for a service. Volumes are directories that are stored outside of the container’s filesystem and which hold reusable and shareable data that can persist even when containers are terminated. This data can be reused by the same service on redeployment, or shared with other services.

#Volumes are initialized when a container is created. If the container’s base image contains data at the specified mount point, that existing data is copied into the new volume upon volume initialization. (Note that this does not apply when mounting a host directory.)
#Data volumes can be shared and reused among containers.
#Changes to a data volume are made directly.
#Changes to a data volume will not be included when you update an image.
#Data volumes persist even if the container itself is deleted.


docker run -it --name hadoop \
-v /tmp/hadoop_image/logs:/opt/hadoop/logs \
-v /tmp/hadoop_image/shared:/root/shared \
-d hadoop:v1
docker exec -it hadoop sh

docker run -it --name hadoop \
-v /tmp/hadoop_image/logs:/opt/hadoop/logs \
-v /tmp/hadoop_image/shared:/root/shared \
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
-p 50090:50090 \
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
-p 8042:8042 \
-p 8088:8088 \
-d hadoop:v1
docker exec -it hadoop:v1 sh


#port a probleme
#-p 8042:8042 \
#-p 8088:8088 \



alias hdp='docker ps -a -q --filter "name=hadoop"'
docker exec -it hadoop sh

source etc/bootstrap.sh

#exemple wordcount
mkdir usr/local/files/
hadoop fs -mkdir -p /usr/local/files/
docker cp Downloads/Hadoop/tmp/new/files/readme.txt hadoop:usr/local/files/
hadoop fs -put /root/shared/readme.txt /user/root/readme.txt
hadoop fs -put readme.txt /user/root/readme.txt
hdfs dfs -rm -R -f /usr/local/files/readme.result/\*
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.0.jar wordcount /user/root/readme.txt /user/root/readme.result
hadoop jar /usr/local/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.3.jar wordcount /user/root/readme.txt /user/root/readme.result
hadoop fs -cat /user/root/readme.result/\*


hdfs dfs -rm -R -f /user/root/readme.result/\*


HDFS NameNode Web UI	http://localhost:50070
HDFS DataNode Web UI	http://localhost:50075
HDFS Secondary NameNode	Web UI http://localhost:50090
YARN Resource Manager Web UI http://localhost:8088
YARN Node Manager  Web UI http://localhost:8042
Ambari http://localhost:8442
Ambari secured http://localhost:8443


sudo chown -R root:root /usr/local/hadoop/bin/hdfs
sudo chmod -R 777 /usr/local/hadoop/bin/hdfs
sudo chown -R root:root hadoop


 adduser -m hduser


#install ambari
#download repo
curl http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.1.0/ambari.repo --output /etc/yum.repos.d/ambari.repo && \
yum install ambari-agent #say y to all prompts
#check ambari-agent.ini file
/etc/ambari-agent/conf/ambari-agent.ini
hostname=localhost
url_port=8442
secured_url_port=8443
docker cp Downloads/Hadoop/tmp/new/files/ambari-agent.ini hadoop:/etc/ambari-agent/conf/ambari-agent.ini

docker cp 7a347acbbb6c:/key.txt /

ambari-agent start

#install ambari-server
curl http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.2.1.0/ambari.repo --output /etc/yum.repos.d/ambari.repo && \
yum -y install ambari-server
ambari-server setup
ambari-server start
ambari-agent start



chmod 600 ./run/postgresql && \
chmod 600 ./usr/lib/ambari-server/postgresql-9.3-1101-jdbc4.jar && \
chmod 600 ./usr/lib/tmpfiles.d/postgresql.conf && \
chmod 600 ./usr/lib/systemd/system/postgresql.service && \
chmod 600 ./usr/bin/postgresql-check-db-dir && \
chmod 600 ./usr/bin/postgresql-setup && \
chmod 600 ./usr/bin/postgres && \
chmod 600 ./usr/libexec/initscripts/legacy-actions/postgresql && \
chmod 600 ./usr/share/pgsql/postgres.description && \
chmod 600 ./usr/share/pgsql/postgres.shdescription && \
chmod 600 ./usr/share/pgsql/postgres.bki && \
chmod 600 ./usr/share/pgsql/postgresql.conf.sample && \
chmod 600 ./usr/share/doc/postgresql-9.2.18 && \
chmod 600 ./etc/pam.d/postgresql

chown root:root ./run/postgresql && \
chown root:root ./usr/lib/ambari-server/postgresql-9.3-1101-jdbc4.jar && \
chown root:root ./usr/lib/tmpfiles.d/postgresql.conf && \
chown root:root ./usr/lib/systemd/system/postgresql.service && \
chown root:root ./usr/bin/postgresql-check-db-dir && \
chown root:root ./usr/bin/postgresql-setup && \
chown root:root ./usr/bin/postgres && \
chown root:root ./usr/libexec/initscripts/legacy-actions/postgresql && \
chown root:root ./usr/share/pgsql/postgres.description && \
chown root:root ./usr/share/pgsql/postgres.shdescription && \
chown root:root ./usr/share/pgsql/postgres.bki && \
chown root:root ./usr/share/pgsql/postgresql.conf.sample && \
chown root:root ./usr/share/doc/postgresql-9.2.18 && \
chown root:root ./etc/pam.d/postgresql


apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update
apt-get install ambari-server

#ambari-setup
user-account n/oracle jdk 1.7/advanced database config n

credentials : admin/admin

su postgres
psql
postgres=# CREATE USER admin WITH password 'admin'
postgres-# GRANT ALL PRIVILEGES ON DATABASE ambari to admin


docker cp hadoop:/var/lib/pgsql/data/pg_hba.conf Downloads/Hadoop/
docker cp Downloads/Hadoop/pg_hba.conf hadoop:/var/lib/pgsql/data/pg_hba.conf

docker cp hadoop:/var/log/ambari-server/ambari-server.out Downloads/Hadoop/
docker cp hadoop:/var/lib/pgsql/data/postgresql.conf Downloads/Hadoop/
docker cp Downloads/Hadoop/postgresql.conf hadoop:/var/lib/pgsql/data/postgresql.conf

docker cp Downloads/Hadoop/tmp/new/bootstrap.sh hadoop:/etc/bootstrap.sh

#problem des ports deja pris
#Get a shell to the VM by connecting via screen:
screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
Run rm /var/lib/docker/network/files/local-kv.db to clear network information, including the allocated ports.
#Exit with the key sequence: Ctrl-A Ctrl-K. Answer y



#.bashrc located in './etc/skel/.bashrc'
#copy to home directory cp /etc/skel/.bashrc ~
docker cp hadoop:/root/.bashrc Downloads/hadoop/tmp/new/bash.bashrc
docker cp Downloads/hadoop/tmp/new/bash.bashrc hadoop:/root/.bashrc


#list of running application from yarn-daemon
yarn application -list



#docker run -it -d --name="hadoop" ubuntu
#change password to container root
ssh -p 22 root@localhost

###### WINDOWS
#on windows, set environnement var to use the dos
set DOCKER_CERT_PATH=%USERPROFILE%\.docker\machine\machines\default
set DOCKER_HOST=tcp://192.168.99.100:2376
set DOCKER_MACHINE_NAME=default
set DOCKER_TLS_VERIFY=1

#use 192.168.99.2376 rather than localhost/0.0.0.0
