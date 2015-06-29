#!/bin/bash

mkdir /opt/activemq
cd /opt/activemq
wget http://archive.apache.org/dist/activemq/apache-activemq/5.9.0/apache-activemq-5.9.0-bin.tar.gz
tar xvzf apache-activemq-5.9.0-bin.tar.gz
ln -s apache-activemq-5.9.0 latest
cd latest
