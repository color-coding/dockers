# 基于镜像ubuntu
FROM colorcoding/developing:ibas

# 维护者
LABEL maintainer="Niuren.Zhu <niuren.zhu@icloud.com>"

# 安装开发工具
# 前端工具-VS Code
ARG VS_CODE_URL=https://vscode.cdn.azure.cn/stable/493869ee8e8a846b0855873886fc79d480d342de/code_1.26.1-1534444688_amd64.deb
RUN set -x \
    && curl -o vscode.deb -L ${VS_CODE_URL} \
    && dpkg -i vscode.deb \
    && rm -rf vscode.deb
# 后端工具-Eclipse
ARG ECLIPSE_URL=http://mirrors.ustc.edu.cn/eclipse/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz
RUN set -x \
    && curl -o eclipse.tar.gz -L ${ECLIPSE_URL} \
    && tar -xvf eclipse.tar.gz -C /usr/share \
    && rm -rf eclipse.tar.gz \
    && echo "[Desktop Entry]"                    >/usr/share/applications/eclipse.desktop \
    && echo "Name=Eclipse"                       >>/usr/share/applications/eclipse.desktop \
    && echo "Comment=Eclipse"                    >>/usr/share/applications/eclipse.desktop \
    && echo "Exec=/usr/share/eclipse/eclipse"    >>/usr/share/applications/eclipse.desktop \
    && echo "Icon=/usr/share/eclipse/icon.xpm"   >>/usr/share/applications/eclipse.desktop \
    && echo "Terminal=false"                     >>/usr/share/applications/eclipse.desktop \
    && echo "Type=Application"                   >>/usr/share/applications/eclipse.desktop \
    && echo "Categories=Development;IDE;"        >>/usr/share/applications/eclipse.desktop \
    && echo "StartupNotify=true"                 >>/usr/share/applications/eclipse.desktop

# 后端工具-Tomcat
ARG TOMCAT_URL=http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.5.33/bin/apache-tomcat-8.5.33.tar.gz
RUN set -x \
    && curl -o apache-tomcat.tar.gz -L ${TOMCAT_URL} \
    && mkdir -p ${CODE_HOME}/../tools \
    && tar -xvf apache-tomcat.tar.gz -C ${CODE_HOME}/../tools \
    && rm -rf apache-tomcat.tar.gz

