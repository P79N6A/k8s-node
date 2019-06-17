################ 警告: 该脚本为预置脚本,研发人员请不要进行修改 ###########################
############### 若需要执行特殊操作,请修改自己的启动脚本里面   ###########################
#!/bin/bash
# 创建日志目录,所有日志均写入容器的 /data/logs 文件夹
function create_log_dir() {
    mkdir -p /data
    mkdir -p /logs/logpath

    # 创建挂载目录
    # mkdir -p /app
    # mkdir -p /app/smartisan.min/www_json

    if [ -f /logs/logpath/$HOSTNAME ] ; then
        LOGPATH=`cat /logs/logpath/$HOSTNAME`
        ln -s $LOGPATH /data/logs
        ln -s $LOGPATH.bak /data/logs.bak
        return
    fi

    LINKLOGDIR=`stat /data/logs |grep "File"|grep "\->"`
    if [ -z "$LINKLOGDIR" ] ; then
        TIMESTAMP=`date +%Y%m%d%H%M%S`
        LOGPATH=/logs/$project/$namespace/$TIMESTAMP.$HOSTNAME
        echo "$LOGPATH" > /logs/logpath/$HOSTNAME
        mkdir -p $LOGPATH $LOGPATH.bak
        ln -s $LOGPATH /data/logs
        ln -s $LOGPATH.bak /data/logs.bak

        # filebeat 用到
        echo "$LOGPATH" > /data/logs/logs.path
    fi
}
create_log_dir
################ 警告: 该脚本为预置脚本,研发人员请不要进行修改 ###########################
############### 若需要执行特殊操作,请修改自己的启动脚本里面   ###########################
