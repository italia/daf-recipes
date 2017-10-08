#/bin/bash

echo "Starting hbase"
/./opt/hbase-1.2.6/bin/start-hbase.sh


env COMPRESSION=NONE HBASE_HOME=/opt/hbase-1.2.6/ /opt/opentsdb-2.3.0/src/create_table.sh

if [ ! -e /opt/data-source ] ; then
    curl 'http://admin:admin@grafana:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"localOpenTSDB","type":"opentsdb","url":"http://hbase-opentsdb:4242","access":"proxy","isDefault":true}'
    touch /opt/data-source
fi;

echo "Creating default dashboard"
curl 'http://admin:admin@grafana:3000/api/dashboards/import' -X POST -H 'Content-Type: application/json;charset=utf-8' --data-binary '{"dashboard":{"__inputs":[{"name":"DS_LOCALOPENTSDB","label":"localOpenTSDB","description":"","type":"datasource","pluginId":"opentsdb","pluginName":"OpenTSDB"}],"__requires":[{"type":"grafana","id":"grafana","name":"Grafana","version":"4.5.2"},{"type":"panel","id":"graph","name":"Graph","version":""},{"type":"datasource","id":"opentsdb","name":"OpenTSDB","version":"1.0.0"}],"annotations":{"list":[]},"editable":true,"gnetId":null,"graphTooltip":0,"hideControls":false,"id":null,"links":[],"refresh":false,"rows":[{"collapse":false,"height":"250px","panels":[{"aliasColors":{},"bars":false,"dashLength":10,"dashes":false,"datasource":"${DS_LOCALOPENTSDB}","fill":1,"id":1,"legend":{"avg":false,"current":false,"max":false,"min":false,"show":true,"total":false,"values":false},"lines":true,"linewidth":1,"nullPointMode":"null","percentage":false,"pointradius":5,"points":false,"renderer":"flot","seriesOverrides":[],"spaceLength":10,"span":12,"stack":false,"steppedLine":false,"targets":[{"aggregator":"sum","disableDownsampling":false,"downsampleAggregator":"avg","downsampleFillPolicy":"none","downsampleInterval":"","metric":"stats_counts.swag1","refId":"A"},{"aggregator":"sum","downsampleAggregator":"avg","downsampleFillPolicy":"none","metric":"stats_counts.swag2","refId":"B"}],"thresholds":[],"timeFrom":null,"timeShift":null,"title":"Panel Title","tooltip":{"shared":true,"sort":0,"value_type":"individual"},"type":"graph","xaxis":{"buckets":null,"mode":"time","name":null,"show":true,"values":[]},"yaxes":[{"format":"short","label":null,"logBase":1,"max":null,"min":null,"show":true},{"format":"short","label":null,"logBase":1,"max":null,"min":null,"show":true}]}],"repeat":null,"repeatIteration":null,"repeatRowId":null,"showTitle":false,"title":"Dashboard Row","titleSize":"h6"}],"schemaVersion":14,"style":"dark","tags":[],"templating":{"list":[]},"time":{"from":"2017-10-07T21:14:00.115Z","to":"2017-10-07T21:27:50.330Z"},"timepicker":{"refresh_intervals":["5s","10s","30s","1m","5m","15m","30m","1h","2h","1d"],"time_options":["5m","15m","1h","6h","12h","24h","2d","7d","30d"]},"timezone":"","title":"HOCCAPITO","version":3},"overwrite":true,"inputs":[{"name":"DS_LOCALOPENTSDB","type":"datasource","pluginId":"opentsdb","value":"localOpenTSDB"}]}'

echo "Starting OpenTSDB"
/./opt/opentsdb-2.3.0/build/tsdb tsd --port=4242 --zkquorum=zookeeper --staticroot=/opt/opentsdb-2.3.0/build/staticroot --config=/opt/opentsdb-2.3.0/src/opentsdb.conf
