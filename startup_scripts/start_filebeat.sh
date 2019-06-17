#!/bin/bash
# 此处需要执行.bash.sh脚本,主要功能为创建/data/logs日志目录。
# 如果不需要日志文件,则可去掉
. /app/.base.sh


## 该脚本主要功能是将/data/logs目录下的*.log文件上传到kafka
function start_filebeat() {
    if [ "$namespace" != "prod" ] ; then
        return
    fi
    mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml.bak
    cp /app/filebeat.yml /etc/filebeat/filebeat.yml
    APP_LOG_PATH="`cat /data/logs/logs.path`"
    sed -i "s%APP_LOGPATH%$APP_LOG_PATH%g" /etc/filebeat/filebeat.yml
    APP_LOG_TOPIC=$project
    sed -i "s/APP_TOPIC/$APP_LOG_TOPIC/g" /etc/filebeat/filebeat.yml

    echo "10.1.3.17 ambari-kafka01.dp.idc.smartisan.com" >> /etc/hosts
    echo "10.1.3.77 ambari-kafka02.dp.idc.smartisan.com" >> /etc/hosts
    echo "10.1.3.89 ambari-kafka03.dp.idc.smartisan.com" >> /etc/hosts
    echo "10.1.3.87 ambari-kafka04.dp.idc.smartisan.com" >> /etc/hosts

    /usr/bin/filebeat.sh -e -c /etc/filebeat/filebeat.yml >/data/logs/filebeat.log 2>&1
}

start_filebeat
