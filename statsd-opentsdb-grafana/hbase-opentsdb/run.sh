#/bin/bash

echo "Starting hbase"
/./opt/hbase-1.2.6/bin/start-hbase.sh

echo "Creating tables"
env COMPRESSION=NONE HBASE_HOME=/opt/hbase-1.2.6/ /opt/opentsdb-2.3.0/src/create_table.sh

echo "Starting OpenTSDB"
/./opt/opentsdb-2.3.0/build/tsdb tsd --port=4242 --zkquorum=zookeeper --staticroot=/opt/opentsdb-2.3.0/build/staticroot --config=/opt/opentsdb-2.3.0/src/opentsdb.conf
