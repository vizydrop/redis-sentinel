FROM redis:3.2-alpine


ADD ./sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf
ENV SENTINEL_QUORUM 2
ENV SENTINEL_DOWN_AFTER 5000
ENV SENTINEL_FAILOVER 10000
ENV SENTINEL_PORT 26000
ENV REDIS_HOST redis
ENV REDIS_PORT 6379
ENV SENTINEL_NAME mymaster
ENV PROTECTED_MODE yes
ADD ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
