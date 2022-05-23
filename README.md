# Remote Server Sync

A Bash script to download / sync files from a remote FTP server to a local directory. For example sync torrents from a seedbox to a media player.

## How to Use

1. The script requires the [LFTP](https://lftp.yar.ru) package:

    ```
    sudo apt-get install lftp
    ```

1. Connect to the SFTP server to add the RSA key fingerprint in the list of known hosts:

    ```
    ssh -p 22 username:password@host
    ```

1. Update config values - example below:

    ```
    login=johnsmith
    pass=password01
    host=example.com
    remote_dir=/path/to/remote/folder
    local_dir=/path/to/local/folder
    log_dir=/path/to/log/folder
    log_file_name=sync.log
    parallel_files=1
    segments=4
    ```

1. Make the script executable:

    ```
    sudo chmod +x sync.sh
    ```

1. Run and test script:

    ```
    ./sync.sh
    ```

### Optional: run the script using cron

1. Install [Screen](https://linux.die.net/man/1/screen) package: 

    ```
    sudo apt install screen
    ```

1. Add these jobs to your cron:

    ```
    ### start download ###
    0 1 * * * /usr/bin/screen -dmS lftp /path/to/script > /dev/null 2>&1

    ### stop download ###
    30 5 * * * pkill lftp  > /dev/null 2>&1
    ```

:exclamation: Remember to update `/path/to/script`