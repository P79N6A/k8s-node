#!/bin/bash
# 此处需要执行.bash.sh脚本,主要功能为创建/data/logs日志目录。
# 如果不需要日志文件,则可去掉
. /app/.base.sh

function start_cron() {
    # 此处添加定时任务内容
    echo "59 23 * * * /bin/bash /root/cut_nginx_log.sh" >> /var/spool/cron/root

    /usr/sbin/crond -n
}

start_cron
