#!/bin/sh
echo '****************************************************************************'
echo '                  builds.sh                                                 '
echo '                      by niuren.zhu                                         '
echo '                           2025.06.19                                       '
echo '  说明：                                                                     '
echo '    1. 编译镜像，并发布到hub.docker.com、quay.io。                              '
echo '    2. 提前登录docker.io、quay.io。                                           '
echo '****************************************************************************'
# 设置参数变量
# 工作目录
WORK_FOLDER=$(pwd)
# 开始时间
START_TIME=$(date +'%Y-%m-%d %H:%M:%S')
echo --开始时间：${START_TIME}
echo --工作目录：${WORK_FOLDER}

# 函数：构建&发布镜像
build() {
  DOCKERFILE=$1
  IMAGE_NAME=$2
  BUILD_ARGS=$3
  buildah build -f ./${DOCKERFILE} -t ${IMAGE_NAME} ${BUILD_ARGS} ./ &&
    buildah tag ${IMAGE_NAME} quay.io/${IMAGE_NAME} &&
    buildah push ${IMAGE_NAME} &&
    buildah push quay.io/${IMAGE_NAME}
}

echo "---JDK---"
OPENJDK_FOLDER=${WORK_FOLDER}/openjdk
if [ -e ${OPENJDK_FOLDER} ]; then
  cd ${OPENJDK_FOLDER}
  build "dockerfile-8-alpine" "colorcoding/openjdk:8-jdk-alpine" ""
  build "dockerfile-8-ubi-minimal" "colorcoding/openjdk:8-jdk-ubi-minimal" ""
fi
echo "---TOMCAT---"
TOMCAT_FOLDER=${WORK_FOLDER}/tomcat
if [ -e ${TOMCAT_FOLDER} ]; then
  cd ${TOMCAT_FOLDER}
  build "dockerfile-9.0-alpine" "colorcoding/tomcat:9.0-alpine" ""
  build "dockerfile-9.0-ubi-minimal" "colorcoding/tomcat:9.0-ubi-minimal" ""
fi
echo "---TOMCAT(ibas)---"
TOMCAT_FOLDER=${WORK_FOLDER}/ibas/tomcat
if [ -e ${TOMCAT_FOLDER} ]; then
  cd ${TOMCAT_FOLDER}
  build "dockerfile-alpine" "colorcoding/tomcat:ibas-alpine" ""
  build "dockerfile-ubi-minimal" "colorcoding/tomcat:ibas-ubi-minimal" ""
  build "dockerfile-alpine" "colorcoding/tomcat:ibas-alpine-v2" "--build-arg BTULZ_TRANSFORMS_VERSION=latest-v2"
  build "dockerfile-ubi-minimal" "colorcoding/tomcat:ibas-ubi-minimal-v2" "--build-arg BTULZ_TRANSFORMS_VERSION=latest-v2"
fi
echo "---NGINX---"
NGINX_FOLDER=${WORK_FOLDER}/nginx
if [ -e ${NGINX_FOLDER} ]; then
  cd ${NGINX_FOLDER}
  build "dockerfile-alpine" "colorcoding/nginx:alpine" ""
fi
echo "---NGINX(ibas)---"
NGINX_FOLDER=${WORK_FOLDER}/ibas/nginx
if [ -e ${NGINX_FOLDER} ]; then
  cd ${NGINX_FOLDER}
  build "dockerfile-alpine" "colorcoding/nginx:ibas-alpine" ""
fi

cd ${WORK_FOLDER}
# 计算执行时间
END_TIME=$(date +'%Y-%m-%d %H:%M:%S')
if [ "$(uname)" = "Darwin" ]; then
  # macOS
  START_SECONDS=$(date -j -f "%Y-%m-%d %H:%M:%S" "$START_TIME" +%s)
  END_SECONDS=$(date -j -f "%Y-%m-%d %H:%M:%S" "$END_TIME" +%s)
else
  START_SECONDS=$(date --date="$START_TIME" +%s)
  END_SECONDS=$(date --date="$END_TIME" +%s)
fi
echo --结束时间：${END_TIME}，共$((END_SECONDS - START_SECONDS))秒
