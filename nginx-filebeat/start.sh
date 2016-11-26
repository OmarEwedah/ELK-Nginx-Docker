#!/bin/bash

curl -XPUT 'http://elk:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
service filebeat restart
update-rc.d filebeat defaults 95 10

service nginx start
tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
