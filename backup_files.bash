#!/bin/bash

#Google drive account where files will be copied
TARGET_ACCOUNT="google-drive://$TARGET_ACCOUNT"

#Target path in remote directory
TARGET_PATH="$TARGET_ACCOUNT/My Drive"


#Var to let us know if a drive is already mounted
INIT_MOUNTED_STATE=false

if [ $(gio info "$TARGET_ACCOUNT" 2>&1 | grep -c "is not mounted" ) -eq 1 ]
then
	echo "Target is not mounted"
else
	echo "Target is already mounted"
	INIT_MOUNTED_STATE="true"
fi

if [ $INIT_MOUNTED_STATE = false ]
then
	echo "mounting..."
	gio mount "$TARGET_ACCOUNT" || exit 1
fi

for i in "${!FILES_TO_BACKUP[@]}"
do
	echo "copying $i..."
	REMOTE_FILE_PATH=$(echo "$TARGET_PATH/${FILES_TO_BACKUP[$i]}" | grep -iaP "^.*\/")
	gio mkdir -p "$REMOTE_FILE_PATH"
	gio copy $( echo $i) "$TARGET_PATH/${FILES_TO_BACKUP[$i]}"
	echo "Backup completed successfully!"
done

if [ $INIT_MOUNTED_STATE = false ]
then
	echo "Unmounting remote drive"
	gio mount -u "$TARGET_ACCOUNT" || exit 1
fi
