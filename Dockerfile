FROM kibana:latest

RUN apt-get update && apt-get install -y netcat

RUN ls /opt/kibana/config/
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN kibana plugin --install elastic/sense

COPY config/kibana.yml /opt/kibana/config/kibana.yml
RUN chmod 777 /opt/kibana/config/kibana.yml

CMD ["/tmp/entrypoint.sh"]
