# Remote Server Sync

A bash script to download / sync files from a remote server to a local directory. For example sync torrents from a seedbox to a media player.

## How to Use

1. Install [LFTP](https://lftp.yar.ru) package:

    ```
    sudo apt-get install lftp
    ```

1. Connect to remote machine to add the RSA key in the list of known hosts:

    ```
    ssh -p 22 username:password@host
    ```

1. Update config values

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

1. Add cron jobs:

    ```
    ### start download ###
    0 1 * * * /usr/bin/screen -dmS <session_name> <script_path> > /dev/null 2>&1

    ### stop download ###
    30 5 * * * pkill <session_name>  > /dev/null 2>&1
    ```