# 基础镜像
ARG habor_addr=harbor.smartisan.com
ARG base_image=smartisan/centos-7.5:node8.11.3
FROM $habor_addr/$base_image

# 准备 /app,/data,/config 目录
RUN mkdir -p /data && mkdir -p /app && mkdir -p /config 

##################BEGIN 研发人员需要在此处将需要的内容COPY到/app目录下 BEGIN############################
# 拷贝程序和配置(此处只拷贝了run.sh,其他文件需研发人员自己添加)
# COPY startup_scripts/.base.sh /app/

COPY startup_scripts/*.sh /app/
# 启动服务
COPY app.js /app/
# 本地项目
COPY routes/* /app/routes/
COPY views/* /app/views/
COPY package.json /app/

##################END   研发人员需要在此处将需要的内容COPY到/app目录下   END############################
# 安装依赖
RUN cd /app && cnpm install
# 给默认sh文件添加可执行权限
RUN chmod +x /app/*.sh
RUN chmod +x /app/.*.sh

# 设定工作目录
WORKDIR /app

# 设置启动程序
ENTRYPOINT ["/bin/bash", "-c"]
# ENTRYPOINT ["node", "/server.js"]
