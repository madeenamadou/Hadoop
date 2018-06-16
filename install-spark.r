 

# install spark 
curl -s https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz | tar -xz -C /usr/local/
cd /usr/local && ln -s ./spark-2.1.1-bin-hadoop2.7 spark

export SPARK_HOME=/usr/local/spark
export PATH=$PATH:/usr/local/spark/bin:/usr/local/spark/sbin

chmod +x /usr/local/spark/conf/*.*
cp /usr/local/spark/conf/spark-env.sh.template /usr/local/spark/conf/spark-env.sh
echo "export JAVA_HOME=/usr/java/default" >> /usr/local/spark/conf/spark-env.sh
echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop" >> /usr/local/spark/conf/spark-env.sh
echo "export SPARK_WORKER_CORES=8" >> /usr/local/spark/conf/spark-env.sh
source /usr/local/spark/conf/spark-env.sh

cp /usr/local/spark/conf/slaves.template /usr/local/spark/conf/slaves




http://192.168.99.100:8080/
http://10.0.0.1:8080/



#launch spark shell
spark-shell
sparkR
pyspark


https://dwbi.org/etl/bigdata/201-install-spark-in-hadoop-cluster


find -name .bashrc
alias cl='clear' >> /root/.bashrc
source /root/.bashrc