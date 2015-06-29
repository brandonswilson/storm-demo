#!/bin/bash

echo 'Attempting to start ActiveMQ...'
/opt/activemq/latest/bin/activemq start xbean:file:/opt/activemq/latest/conf/activemq.xml

echo 'Deploying the storm topology...'
storm jar storm-streaming/target/storm-streaming-1.0-SNAPSHOT.jar com.hortonworks.streaming.impl.topologies.TruckEventProcessorKafkaTopology /etc/storm_demo/config.properties -c nimbus.host localhost

#echo 'Attempting to start Kafka...'
#nohup /opt/kafka/latest/bin/kafka-server-start.sh /opt/kafka/latest/config/server.properties&
#sleep 5

echo 'Starting the demo webapp...'
cd storm-demo-webapp
mvn clean package
mvn jetty:run -Djetty.port=8081