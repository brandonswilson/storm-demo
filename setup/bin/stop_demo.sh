#!/bin/bash

echo 'Stopping the Kafka server...'
/opt/kafka/latest/bin/kafka-server-stop.sh

echo 'Stopping ActiveMQ...'
/opt/activemq/latest/bin/activemq stop