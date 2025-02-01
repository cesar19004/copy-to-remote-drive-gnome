## Description

This repository provides a simple tool to copy files to Google Drive. It was originally created to back up the KeePassXC database.


## Requirements

This tool uses GIO (GNOME Input/Output) to handle Google Drive as a virtual file system. Therefore, it only works on Linux distributions with GNOME as the desktop environment (DE).

## Usage
- Clone the repository
```
git clone https://github.com/cesar19004/copy-to-remote-drive-gnome && cd copy-to-remote-drive-gnome
```

- Copy `.env.example` file content to a new `.env` file
```
cp .env.example .env
```

- Update environment variables

Open the .env file and replace the variables with your desired values.

- Install the script as a service and start it
```
sudo bash install-service.bash
```
### optional
- **Check the service status**

To check whether the service is running, use:
```
sudo systemctl status backup_files.timer
```
- **View service logs**

If you need to see the logs, run:
```
sudo journalctl -u backup_files.service
```