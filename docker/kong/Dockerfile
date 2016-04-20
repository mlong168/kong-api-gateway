FROM mashape/kong

ENV CASSANDRA_HOSTNAME kong-database
ENV CASSANDRA_PORT 9042

COPY start_kong /usr/bin/start_kong

CMD start_kong
