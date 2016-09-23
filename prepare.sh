#!/bin/bash
#   Script for local installation of solr
#
#   This file is part of novasearch.
#
#   novasearch is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   novasearch is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with novasearch.  If not, see <http://www.gnu.org/licenses/>.

cd dataset
wget -c "http://mirror2.shellbot.com/apache/lucene/solr/6.2.1/solr-6.2.1.tgz"
tar -xvzf solr-6.2.1.tgz
mv solr-6.2.1 solr
cd ..