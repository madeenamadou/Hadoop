#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm -rf /tmp/*.pid

# Get the namenode host address
if [ -z $HADOOP_HOST_NAMENODE ]; then 
 HADOOP_HOST_NAMENODE=$HOSTNAME;
 echo "No namenode passed, setting short hostname to namenode. Pass in a value for HADOOP_HOST_NAMENODE to set namenode host.";
fi

if [ ! -e  $HADOOP_PREFIX/etc/hadoop/core-site.xml ]
then
        echo "Changing Hostname in core-site.xml"
        sed s/HOSTNAME/$HADOOP_HOST_NAMENODE/ $HADOOP_PREFIX/etc/hadoop/core-site.xml.template > $HADOOP_PREFIX/etc/hadoop/core-site.xml
else
        echo "core-site.xml exists: "
        cat $HADOOP_PREFIX/etc/hadoop/core-site.xml
fi

service sshd start
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh

if [[ $1 == "-d" ]]; then
  while true; do sleep 1; done
fi

if [[ $1 == "-bash" ]]; then
    /bin/bash
fi
