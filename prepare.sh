#!/bin/bash
cd dataset
wget -c "http://mirror2.shellbot.com/apache/lucene/solr/6.2.1/solr-6.2.1.tgz"
tar -xvzf solr-6.2.1.tgz

cd ..