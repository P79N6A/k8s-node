#!/bin/bash
# 此处需要执行.bash.sh脚本,主要功能为创建/data/logs日志目录。
# 如果不需要日志文件,则可去掉
. /app/.base.sh

#################### 启动node
# php程序会用到,将流量导向127.0.0.1:9000
function start_node() {
    # npm start
    # ln -s /opt/node-v8.11.3-linux-x64/bin/npm   /usr/local/bin/ 
    # ln -s /opt/node-v8.11.3-linux-x64/bin/node   /usr/local/bin/
    pm2 start /app/app.js
    pm2 logs
    echo "pm2 server start"
  }

start_node
