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
    "root": "/home/files",
    "commands": "cd ls cp mkdir mv rm cat echo touch find chmod clear more tar unzip unrar gunzip gzip dos2unix curl wget ftpget ftpput ping git gost"
}
EOF
fi
nohup filebrowser &
# gost - an proxy
gost -L http://:8080 -L "mws://:8090?compression=true" -D
