#!/bin/bash

mkdir /opt/activemq
cd /opt/activemq
wget http://apache.mirrors.lucidnetworks.net/activemq/5.9.1/apache-activemq-5.9.1-bin.tar.gz
tar xvzf apache-activemq-5.9.1-bin.tar.gz
ln -s apache-activemq-5.9.1 latest
cd latest
