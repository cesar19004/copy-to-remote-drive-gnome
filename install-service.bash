#!/bin/bash

cp backup_files.bash /usr/local/bin || exit 1
chmod +x /usr/local/bin/backup_files.bash

cp service/backup_files.service /etc/systemd/system/backup_files.service

cp service/backup_files.timer /etc/systemd/system/backup_files.timer

systemctl daemon-reload
systemctl enable backup_files.timer
systemctl start backup_files.timer
