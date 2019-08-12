#!/bin/sh

sed -i "s/\$PROTECTED_MODE/$PROTECTED_MODE/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_NAME/$SENTINEL_NAME/g" /etc/redis/sentinel.conf
sed -i "s/\$REDIS_PORT/$REDIS_PORT/g" /etc/redis/sentinel.conf
sed -i "s/\$REDIS_HOST/$REDIS_HOST/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_PORT/$SENTINEL_PORT/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_DOWN_AFTER/$SENTINEL_DOWN_AFTER/g" /etc/redis/sentinel.conf
sed -i "s/\$SENTINEL_FAILOVER/$SENTINEL_FAILOVER/g" /etc/redis/sentinel.conf

exec docker-entrypoint.sh redis-server /etc/redis/sentinel.conf --sentinel
