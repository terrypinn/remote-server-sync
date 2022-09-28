#!/bin/bash

# remote machine 
remote_host=
remote_username=
remote_password=
remote_dir_path=

# local machine
target_dir_path=
lock_file_path=/tmp/sync.lock
log_file_path=~/sync.log

# lftp
connections=4
parallel_files=2

trap "rm -f $lock_file_path" SIGINT SIGTERM
if [ -e $lock_file_path ]
then
        echo "Sync is running already"
        exit 1
elif [ ! -e $target_dir_path ]
then
        echo "$target_dir_path: No such file or directory"
        exit 1
else
        touch $lock_file_path
        lftp sftp://$remote_username:$remote_password@$remote_host << EOF
        mirror --continue --parallel=$parallel_files --use-pget-n=$connections --log=$log_file_path $remote_dir_path $target_dir_path
        quit
EOF
        rm -f $lock_file_path
        exit 0
fi