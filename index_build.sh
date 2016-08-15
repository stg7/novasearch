#!/bin/bash

cd solr-6.1.0
./bin/solr start -m 5g
./bin/solr create -c acm-pdfs
./bin/post -c acm-pdfs ../pdf/


# optimize index
curl "http://localhost:8983/solr/acm-pdfs/update?optimize=true"
