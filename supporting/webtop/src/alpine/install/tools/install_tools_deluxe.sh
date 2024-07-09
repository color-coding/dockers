#!/usr/bin/env bash
set -ex

apk add --no-cache \
  git \
  tmux \
  xdotool \
  curl \
  openssh-client \
  libcap \
  thunar-archive-plugin xarchiver zip unzip p7zip lzop cpio
