#!/bin/bash
#
# /usr/local/bin/start.sh
# Start Elasticsearch, Logstash and Kibana services


service elasticsearch start
#update-rc.d elasticsearch defaults 95 10

#wait for elasticsearch to start up - https://github.com/elasticsearch/kibana/issues/3077
counter=0
while [ ! "$(curl localhost:9200 2> /dev/null)" -a $counter -lt 130  ]; do
  sleep 1
  ((counter++))
  echo "waiting for Elasticsearch to be up ($counter/130)"
done

service logstash start

service kibana start

/opt/logstash/bin/logstash -f /etc/logstash/conf.d/logstash.conf

#RUN cd ~ \
# && curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.1.0.zip \
# && apt-get -y install unzip \
# && unzip beats-dashboards-*.zip \
# && cd beats-dashboards-* \
# && ./load.sh

#tail -f /var/log/elasticsearch/elasticsearch.log

