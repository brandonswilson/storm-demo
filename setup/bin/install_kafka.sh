#!/bin/bash

mkdir /opt/kafka
cd /opt/kafka
wget http://mirror.cogentco.com/pub/apache/kafka/0.8.1.1/kafka_2.8.0-0.8.1.1.tgz
tar xvzf kafka_2.8.0-0.8.1.1.tgz
ln -s kafka_2.8.0-0.8.1.1/ latest
cd latest