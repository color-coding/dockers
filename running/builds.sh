#!/bin/sh
# ****************************************************************************
#                    builds.sh
#                        by niuren.zhu
#                             2025.06.19
#  说明：
#    1. 编译镜像，并发布到 hub.docker.com、quay.io。
#    2. 脚本会自动登录 docker.io、quay.io，请按提示输入凭据。
#    3. 默认编译全部镜像，也可以通过参数选择或跳过编译目标。
#    4. 支持的目标：jdk、tomcat、tomcat-ibas、nginx、nginx-ibas。
#    5. 自动使用 podman、buildah 或 docker，也可通过 CONTAINER_ENGINE 指定。
# ****************************************************************************

set -eu

SCRIPT_FOLDER=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ONLY_TARGETS=
SKIP_TARGETS=
CONTAINER_ENGINE=${CONTAINER_ENGINE:-}

usage() {
  cat <<'EOF'
用法：
  builds.sh [选项] [目标 ...]

选项：
  -t, --target TARGETS  仅构建指定目标，可重复或使用逗号分隔
  -s, --skip TARGETS    跳过指定目标，可重复或使用逗号分隔
  -h, --help            显示帮助

目标：
  jdk                  OpenJDK 镜像
  tomcat               Tomcat 镜像
  tomcat-ibas          IBAS Tomcat 镜像
  nginx                Nginx 镜像
  nginx-ibas           IBAS Nginx 镜像

示例：
  ./builds.sh
  ./builds.sh --only jdk,tomcat
  ./builds.sh --skip tomcat-ibas nginx-ibas
  ./builds.sh jdk nginx
EOF
}

valid_target() {
  case "$1" in
    jdk|openjdk|tomcat|tomcat-ibas|ibas-tomcat|nginx|nginx-ibas|ibas-nginx) return 0 ;;
    *) return 1 ;;
  esac
}

canonical_target() {
  case "$1" in
    openjdk) echo jdk ;;
    ibas-tomcat) echo tomcat-ibas ;;
    ibas-nginx) echo nginx-ibas ;;
    *) echo "$1" ;;
  esac
}

validate_targets() {
  value=$1
  [ -n "$value" ] || return 0
  old_ifs=$IFS
  IFS=,
  for target in $value; do
    IFS=$old_ifs
    [ -n "$target" ] && valid_target "$target" || {
      echo "未知目标：$target" >&2
      usage >&2
      exit 2
    }
    IFS=,
  done
  IFS=$old_ifs
}

add_targets() {
  target=$(canonical_target "$1")
  if [ -n "$ONLY_TARGETS" ]; then ONLY_TARGETS=$ONLY_TARGETS,$target; else ONLY_TARGETS=$target; fi
}

add_skip_targets() {
  target=$(canonical_target "$1")
  if [ -n "$SKIP_TARGETS" ]; then SKIP_TARGETS=$SKIP_TARGETS,$target; else SKIP_TARGETS=$target; fi
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -t|--target|--only)
      [ "$#" -ge 2 ] || { echo "选项 $1 缺少参数" >&2; exit 2; }
      add_targets "$2"; shift 2 ;;
    --target=*|--only=*) add_targets "${1#*=}"; shift ;;
    -s|--skip)
      [ "$#" -ge 2 ] || { echo "选项 $1 缺少参数" >&2; exit 2; }
      add_skip_targets "$2"; shift 2 ;;
    --skip=*) add_skip_targets "${1#*=}"; shift ;;
    -h|--help) usage; exit 0 ;;
    --)
      shift
      while [ "$#" -gt 0 ]; do add_targets "$1"; shift; done ;;
    -*) echo "未知选项：$1" >&2; usage >&2; exit 2 ;;
    *) add_targets "$1"; shift ;;
  esac
done

validate_targets "$ONLY_TARGETS"
validate_targets "$SKIP_TARGETS"

selected() {
  target=$1
  case ",$SKIP_TARGETS," in *,"$target",*) return 1 ;; esac
  [ -z "$ONLY_TARGETS" ] && return 0
  case ",$ONLY_TARGETS," in *,"$target",*) return 0 ;; *) return 1 ;; esac
}

build() {
  dockerfile=$1
  image_name=$2
  build_args=${3-}
  echo "构建：$image_name"
  "$CONTAINER_ENGINE" build -f "$dockerfile" -t "$image_name" $build_args ./ \
    && "$CONTAINER_ENGINE" tag "$image_name" "quay.io/$image_name" \
    && "$CONTAINER_ENGINE" push "$image_name" \
    && "$CONTAINER_ENGINE" push "quay.io/$image_name"
}

login_registries() {
  echo "登录 Docker Hub（docker.io）"
  "$CONTAINER_ENGINE" login docker.io
  echo "登录 Quay（quay.io）"
  "$CONTAINER_ENGINE" login quay.io
}

select_engine() {
  if [ -n "$CONTAINER_ENGINE" ]; then
    case "$CONTAINER_ENGINE" in
      podman|buildah|docker) ;;
      *) echo "CONTAINER_ENGINE 只能是 podman、buildah 或 docker：$CONTAINER_ENGINE" >&2; exit 2 ;;
    esac
    command -v "$CONTAINER_ENGINE" >/dev/null 2>&1 || {
      echo "找不到容器引擎：$CONTAINER_ENGINE" >&2
      exit 1
    }
  elif command -v podman >/dev/null 2>&1; then
    CONTAINER_ENGINE=podman
  elif command -v buildah >/dev/null 2>&1; then
    CONTAINER_ENGINE=buildah
  elif command -v docker >/dev/null 2>&1; then
    CONTAINER_ENGINE=docker
  else
    echo "找不到 podman、buildah 或 docker，请安装容器构建工具" >&2
    exit 1
  fi
  echo "容器引擎：$CONTAINER_ENGINE"
}

build_group() {
  target=$1
  folder=$2
  shift 2
  selected "$target" || { echo "跳过目标：$target"; return 0; }
  [ -d "$folder" ] || { echo "目录不存在，跳过：$folder"; return 0; }
  echo "--- $target ---"
  cd "$folder"
  while [ "$#" -gt 0 ]; do
    build "$1" "$2" "${3-}"
    shift 3
  done
}

START_SECONDS=$(date +%s)
echo "工作目录：$SCRIPT_FOLDER"
echo "仅构建：${ONLY_TARGETS:-全部}；跳过：${SKIP_TARGETS:-无}"
select_engine
login_registries

build_group jdk "$SCRIPT_FOLDER/openjdk" \
  dockerfile-8-alpine colorcoding/openjdk:8-jdk-alpine "" \
  dockerfile-21-ubi-minimal colorcoding/openjdk:21-jdk-ubi-minimal ""
build_group tomcat "$SCRIPT_FOLDER/tomcat" \
  dockerfile-9.0-alpine colorcoding/tomcat:9.0-alpine "" \
  dockerfile-11-ubi-minimal colorcoding/tomcat:11-ubi-minimal ""
build_group tomcat-ibas "$SCRIPT_FOLDER/ibas/tomcat" \
  dockerfile-alpine colorcoding/tomcat:ibas-alpine "" \
  dockerfile-ubi-minimal colorcoding/tomcat:ibas-ubi-minimal-v2 "--build-arg BTULZ_TRANSFORMS_VERSION=latest-v2"
build_group nginx "$SCRIPT_FOLDER/nginx" \
  dockerfile-alpine colorcoding/nginx:alpine ""
build_group nginx-ibas "$SCRIPT_FOLDER/ibas/nginx" \
  dockerfile-alpine colorcoding/nginx:ibas-alpine ""

cd "$SCRIPT_FOLDER"
END_SECONDS=$(date +%s)
echo "完成，共 $((END_SECONDS - START_SECONDS)) 秒"
