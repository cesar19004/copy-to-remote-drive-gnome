## Description

This repository provides a simple tool to copy files to Google Drive. It was originally created to back up the KeePassXC database.


## Requirements

This tool uses GIO (GNOME Input/Output) to handle Google Drive as a virtual file system. Therefore, it only works on Linux distributions with GNOME as the desktop environment (DE).

## Usage
- Clone the repository
```shell
git clone https://github.com/cesar19004/copy-to-remote-drive-gnome && cd copy-to-remote-drive-gnome
```

- Copy `.env.example` file content to a new `.env` file
```shell
cp .env.example .env
```

- Update environment variables

Open the .env file and replace the variables with your desired values.

- Install the script as a service and start it
```shell
bash install-service.bash
```
### optional
- **Check the service status**

To check whether the service is running, use:
```shell
systemctl --user status backup_files.timer
```
- **View service logs**

If you need to see the logs, run:
```shell
journalctl --user -u backup_files.service
```

## Uninstall
If you want to uninstall the service, run:
```shell
systemctl --user stop backup_files.timer
systemctl --user disable backup_files.timer
rm ~/.config/systemd/user/backup_files.service
rm ~/.config/systemd/user/backup_files.timer
rm ~/.bin/backup_files.bash
systemctl --user daemon-reload
```