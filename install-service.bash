#!/bin/bash

#Append backup_files.bash without shebang to .env
{ cat .env ; echo''; tail -n +2 backup_files.bash; } > /usr/local/bin/backup_files.bash || exit 1

chmod +x /usr/local/bin/backup_files.bash

cp service/backup_files.service /etc/systemd/system/backup_files.service

cp service/backup_files.timer /etc/systemd/system/backup_files.timer

systemctl daemon-reload
systemctl enable backup_files.timer
systemctl start backup_files.timer
