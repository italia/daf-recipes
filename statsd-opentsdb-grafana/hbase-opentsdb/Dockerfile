FROM ubuntu

WORKDIR /opt

RUN apt-get update && apt-get install -y software-properties-common wget dh-autoreconf supervisor gnuplot openssh-server adduser libfontconfig curl
RUN add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install -y openjdk-8-jdk

RUN mkdir -p /opt/data/hbase /tmp/opentsdb_cache

# Hbase configuration and installation
RUN if [ ! -e hbase-1.2.6-bin.tar.gz ] ; then wget http://www-eu.apache.org/dist/hbase/1.2.6/hbase-1.2.6-bin.tar.gz ; fi
RUN tar xzf /opt/hbase-1.2.6-bin.tar.gz

RUN rm /opt/hbase-1.2.6/conf/hbase-site.xml
ADD hbase-site.xml /opt/hbase-1.2.6/conf/
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /opt/hbase-1.2.6/conf/hbase-env.sh

# OpenTSDB configuration and installation
RUN if [ ! -e v2.3.0.tar.gz ] ; then wget  https://github.com/OpenTSDB/opentsdb/archive/v2.3.0.tar.gz ; fi
RUN tar -xzf /opt/v2.3.0.tar.gz

RUN  cd /opt/opentsdb-2.3.0/ && sh /opt/opentsdb-2.3.0/build.sh

RUN rm -f /opt/opentsdb-2.3.0/src/opentsdb.conf
ADD opentsdb.conf /opt/opentsdb-2.3.0/src/
ADD run.sh /opt
