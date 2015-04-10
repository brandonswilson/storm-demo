#!/bin/bash

mkdir /usr/share/maven
cd /usr/share/maven
wget http://mirrors.advancedhosters.com/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
tar xvzf apache-maven-3.3.1-bin.tar.gz
ln -s /usr/share/maven/apache-maven-3.3.1/ /usr/share/maven/latest
echo 'M2_HOME=/usr/share/maven/latest' >> ~/.bashrc
echo 'M2=$M2_HOME/bin' >> ~/.bashrc
echo 'PATH=$PATH:$M2' >> ~/.bashrc