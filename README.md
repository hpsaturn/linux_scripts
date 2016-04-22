# Linux Tools and personal Scripts

## freemem

Basic tool for free swap and caches, restore memory to after boot stage

## firefox_run/stop

CONT and STOP signals to kill command over firefox pid process

## backup tool

Full and incremental backup script.


#### Syntax:

   ```
   $ backup NameOfBackup RootStorage DirToBackup [SecondaryStorage]"
   ```

##### Basic Usage:

   ```
   $ backup home /bkp /home/user
   ```

##### Example dual storage:

   ```
   $ backup home /bkp /home/user /mnt/samba/bkp" 
   ```

##### Crontab config:

   ```
   00  19  *   *   *   /home/user/bin/backup home /bkp /home/user /mnt/samba/bkp
   ```

