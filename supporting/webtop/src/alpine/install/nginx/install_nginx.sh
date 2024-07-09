#!/usr/bin/env bash
set -ex

apk add --no-cache \
  nginx \
  libcap

# setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx
# chown root /usr/sbin/nginx && chmod u+s /usr/sbin/nginx
# echo 'net.ipv4.ip_unprivileged_port_start=0' >/etc/sysctl.d/50-unprivileged-ports.conf
# setcap cap_sys_admin+ep /sbin/sysctl && sysctl -w net.ipv4.ip_unprivileged_port_start=0

# set permissions
setcap 'cap_net_bind_service=+ep' /usr/sbin/nginx

# chmod a+s /usr/sbin/nginx
# change user
# mkdir -p /var/run/nginx
# mkdir -p /var/cache/nginx
# chown -R 1000 /var/log/nginx
# chown -R 1000 /etc/nginx
# chown -R 1000 /usr/sbin/nginx
# chown -R 1000 /var/cache/nginx
# chown -R 1000 /var/run/nginx

cat >/etc/nginx/nginx.conf <<EOF
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    client_max_body_size 1024m;

    #for websocket
    map \$http_upgrade \$connection_upgrade {
        default upgrade;
        ''      close;
    }

    server {
      listen       $NGINX_PORT;
      server_name  localhost;

      location / {
        proxy_pass http://localhost:$NO_VNC_PORT/;
        proxy_redirect off;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header REMOTE-HOST \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      }
    }
}
EOF
