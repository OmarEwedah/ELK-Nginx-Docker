# The task is to build a web server serving any web application and send the web server logs to elasticsearch.

# ELK stack setup has the following main components:
 •  Nginx for serving any web pages
 •  Logstash: The server component of Logstash that processes incoming logs
 •  Elasticsearch: Stores all of the logs
 •  Kibana: Web interface for searching and visualizing logs, which will be proxied through Nginx
 •  Docker compose to run all the components
