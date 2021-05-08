#!/bin/bash

MEMORY_TOTAL=`cat /proc/meminfo | grep MemTotal | awk '{print $2}'`
MEMORY_TOTAL_GB=$((MEMORY_TOTAL / 1000000))

INNODB_BUFFER_POOL_SIZE=$((MEMORY_TOTAL * 256 / 1000000))
echo "INNODB_BUFFER_POOL_SIZE: "$INNODB_BUFFER_POOL_SIZE
MEMCACHE_SIZE=$((MEMORY_TOTAL * 128 / 1000000))
echo "MEMCACHE_SIZE: "$MEMCACHE_SIZE

FILE=/etc/sysconfig/memcached
if [ -f "$FILE" ]; then
cat > $FILE <<EOT
PORT="11211"
USER="memcached"
MAXCONN="2048"
CACHESIZE="${MEMCACHE_SIZE}"
OPTIONS="-U 0 -l 127.0.0.1"
EOT
/bin/systemctl restart memcached.service
fi

