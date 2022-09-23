#/bin/bash

DATE=`date +%Y%m%d`
DBNAME=$1
HOST=$2

cd /mnt/db/bkp
influxd backup -portable -database $DBNAME -host $HOST:8088 $DBNAME-snap-$DATE

