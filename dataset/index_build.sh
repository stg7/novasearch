#!/bin/bash
#   Script for indexing pdf files
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

cd solr
./bin/solr start -m 5g
./bin/solr create -c acm-pdfs
./bin/post -c acm-pdfs ../pdf/

# optimize index
curl "http://localhost:8983/solr/acm-pdfs/update?optimize=true"
