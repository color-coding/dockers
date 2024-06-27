#!/bin/sh

# filebrowser - a simple files server
if [ ! -e /home/files ]; then
    mkdir -p /home/files
fi
if [ ! -e /etc/filebrowser ]; then
    mkdir -p /etc/filebrowser
fi
if [ ! -e /etc/filebrowser/.filebrowser.json ]; then
    cat >/etc/filebrowser/.filebrowser.json <<EOF
{
    "port": 80,
    "baseURL": "",
    "address": "",
    "log": "stdout",
    "database": "/etc/filebrowser/database.db",
    "root": "/home/files"
}
EOF
fi
if [ ! -e /etc/filebrowser/database.db ]; then
    filebrowser config init
    filebrowser config set --commands "cd,ls,cp,mkdir,mv,rm,ln,cat,echo,touch,find,chmod,more,free,df,tar,unzip,unrar,curl,aria2c,ping,telnet,scp,ssh"
    filebrowser users add "admin" "1q2w3e"
fi
# filebrowser - a nas
nohup filebrowser
