#/bin/bash

echo "Starting hbase"
/./opt/hbase-1.2.6/bin/start-hbase.sh


env COMPRESSION=NONE HBASE_HOME=/opt/hbase-1.2.6/ /opt/opentsdb-2.3.0/src/create_table.sh


if [ ! -e /opt/data-source ] ; then
    curl 'http://admin:admin@grafana:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"localOpenTSDB","type":"opentsdb","url":"http://hbase-opentsdb:4242","access":"proxy","isDefault":true}'
    touch /opt/data-source;
fi;


echo "Starting OpenTSDB"
/./opt/opentsdb-2.3.0/build/tsdb tsd --port=4242 --zkquorum=zookeeper --staticroot=/opt/opentsdb-2.3.0/build/staticroot --config=/opt/opentsdb-2.3.0/src/opentsdb.conf
