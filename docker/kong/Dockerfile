FROM mashape/kong:0.7.0

ENV CASSANDRA_HOSTNAME cassandra
ENV CASSANDRA_PORT 9042

COPY start_kong /usr/bin/start_kong

CMD start_kong
