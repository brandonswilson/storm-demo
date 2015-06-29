#!/bin/bash

echo 'Making HDFS directories...'
runuser -l hdfs -c 'hadoop fs -mkdir -p /truck-events-v4/staging'
runuser -l hdfs -c 'hadoop fs -chown -R storm /truck-events-v4'

#echo 'Attempting to start Kafka...'
#nohup /opt/kafka/latest/bin/kafka-server-start.sh /opt/kafka/latest/config/server.properties&
#sleep 5

echo 'Starting ActiveMQ...'
/opt/activemq/latest/bin/activemq start xbean:file:/opt/activemq/latest/conf/activemq.xml

echo 'Importing hbase-site.xml into storm topology...'
cp /etc/hbase/conf/hbase-site.xml storm-streaming/src/main/resources

echo 'Exporting demo configuration...'
mkdir -p /etc/storm_demo
cp config.properties /etc/storm_demo

echo 'Creating truck_events topic in Kafka...'
/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --create --zookeeper sandbox.hortonworks.com:2181 --replication-factor 1 --partitions 2 --topic truck_events

echo 'Creating HBase and Hive Tables to store events...'
./ddl_config.sh

echo 'Building and installing demo modules (may take a few minutes)...'
mvn clean install
