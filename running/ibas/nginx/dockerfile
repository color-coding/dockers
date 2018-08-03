# 基于官方nginx镜像
FROM nginx:latest

# 维护者
LABEL maintainer="Niuren.Zhu <niuren.zhu@icloud.com>"

# 安装工具
RUN set -x \
    # 更新源
    && apt-get update \
    # 安装解压
    && apt-get install -y unzip curl wget \
    # 删除源
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 环境变量-NGINX目录
ENV NGINX_HOME /usr/share/nginx
# 创建数据文件夹
RUN set -x \
    && mkdir -p ${NGINX_HOME}

# 下载并部署工具
RUN set -x \
    && curl -fsSL -o /tmp/btulz.scripts.tar http://maven.colorcoding.org/repository/maven-releases/org/colorcoding/tools/btulz.scripts/latest/btulz.scripts-latest.tar \
    && mkdir -p /tmp/btulz.scripts \
    && tar -xvf /tmp/btulz.scripts.tar -C /tmp/btulz.scripts \
    && rm -f /tmp/btulz.scripts.tar \
    && cp -f /tmp/btulz.scripts/ibas/deploy_apps.sh ${NGINX_HOME}/deploy_apps.sh \
    && rm -rf /tmp/btulz.scripts

RUN chmod 775 ${NGINX_HOME}/*.sh

# 设置工作目录
WORKDIR ${NGINX_HOME}
