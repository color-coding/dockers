#!/bin/sh
# ****************************************************************************
#                    builds.sh
#                        by niuren.zhu
#                             2025.06.19
#  说明：
#    1. 编译 IBAS 应用的编译环境及开发环境镜像。
#    2. 编译完成后发布到 hub.docker.com、quay.io。
#    3. 脚本会自动登录 docker.io、quay.io，请按提示输入凭据。
#    4. 默认编译全部镜像，也可以通过参数选择编译目标。
#    5. 自动使用 podman、buildah 或 docker，也可通过 CONTAINER_ENGINE 指定。
# ****************************************************************************

set -eu

SCRIPT_FOLDER=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ONLY_TARGETS=
CONTAINER_ENGINE=${CONTAINER_ENGINE:-}

usage() {
  cat <<'EOF'
用法：
  builds.sh [选项] [目标 ...]

选项：
  -t, --target TARGETS  仅构建指定目标，可重复或使用逗号分隔
  -h, --help            显示帮助

目标：
  ibas-alpine           colorcoding/compiling:ibas-alpine
  ibas-ubi-minimal-v2   colorcoding/compiling:ibas-ubi-minimal-v2
  webtop-ibas-ubuntu    colorcoding/webtop:ibas-ubuntu
EOF
}

add_targets() {
  if [ -n "$ONLY_TARGETS" ]; then ONLY_TARGETS=$ONLY_TARGETS,$1; else ONLY_TARGETS=$1; fi
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -t|--target|--only)
      [ "$#" -ge 2 ] || { echo "选项 $1 缺少参数" >&2; exit 2; }
      add_targets "$2"; shift 2 ;;
    --target=*|--only=*) add_targets "${1#*=}"; shift ;;
    -h|--help) usage; exit 0 ;;
    --)
      shift
      while [ "$#" -gt 0 ]; do add_targets "$1"; shift; done ;;
    -*) echo "未知选项：$1" >&2; usage >&2; exit 2 ;;
    *) add_targets "$1"; shift ;;
  esac
done

valid_target() {
  case "$1" in
    ibas-alpine|ibas-ubi-minimal-v2|webtop-ibas-ubuntu) return 0 ;;
    *) return 1 ;;
  esac
}

selected() {
  [ -z "$ONLY_TARGETS" ] && return 0
  case ",$ONLY_TARGETS," in *,"$1",*) return 0 ;; *) return 1 ;; esac
}

old_ifs=$IFS
IFS=,
for target in $ONLY_TARGETS; do
  IFS=$old_ifs
  [ -n "$target" ] && valid_target "$target" || {
    echo "未知目标：$target" >&2
    usage >&2
    exit 2
  }
  IFS=,
done
IFS=$old_ifs

build() {
  dockerfile=$1
  image_name=$2
  echo "构建：$image_name"
  "$CONTAINER_ENGINE" build -f "$dockerfile" -t "$image_name" ./ \
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

build_target() {
  target=$1
  dockerfile=$2
  image_name=$3
  selected "$target" || { echo "跳过目标：$target"; return 0; }
  cd "$SCRIPT_FOLDER/ibas"
  build "$dockerfile" "$image_name"
}

START_SECONDS=$(date +%s)
echo "工作目录：$SCRIPT_FOLDER"
echo "仅构建：${ONLY_TARGETS:-全部}"
select_engine
login_registries
cd "$SCRIPT_FOLDER"
build_target ibas-alpine dockerfile-alpine colorcoding/compiling:ibas-alpine
build_target ibas-ubi-minimal-v2 dockerfile-21-ubi-minimal colorcoding/compiling:ibas-ubi-minimal-v2
build_target webtop-ibas-ubuntu dockerfile-vscode-eclipse colorcoding/webtop:ibas-ubuntu
END_SECONDS=$(date +%s)
echo "完成，共 $((END_SECONDS - START_SECONDS)) 秒"
