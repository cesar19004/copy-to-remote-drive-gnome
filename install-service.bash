#!/bin/bash

SERVICEPATH="$HOME/.config/systemd/user"
SCRIPTPATH="$HOME/.bin"

# Create a path to store the script if it does not exist.
mkdir -p $SCRIPTPATH

#Append backup_files.bash without shebang to .env
{ cat .env ; echo''; tail -n +2 backup_files.bash; } > "$SCRIPTPATH/backup_files.bash" || exit 1

chmod +x "$SCRIPTPATH/backup_files.bash"

cp service/backup_files.service $SERVICEPATH/backup_files.service

cp service/backup_files.timer $SERVICEPATH/backup_files.timer

systemctl --user daemon-reload
systemctl --user enable backup_files.timer
systemctl --user start backup_files.timer
