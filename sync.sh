#!/bin/bash
login=
pass=
host=
remote_dir=
local_dir=
log_dir=
log_file_name=remote-server-sync.log
parallel_files=1
segments=4

trap "rm -f /tmp/remote-server-sync.lock" SIGINT SIGTERM
if [ -e /tmp/remote-server-sync.lock ]
then
        echo "Remote server sync is running already."
        exit 1
else
        touch /tmp/remote-server-sync.lock
        lftp -u $login,$pass $host << EOF
        set ssl:verify-certificate false
        set mirror:use-pget-n $segments
        #set net:limit-rate 1000:512000
        mirror -c -P$parallel_files --log=$log_dir$log_file_name $remote_dir $local_dir
        quit
EOF
        rm -f /tmp/remote-server-sync.lock
        exit 0
fi
