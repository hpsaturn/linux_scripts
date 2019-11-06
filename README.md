# Linux Tools and personal Scripts

Here you have some documentation of some scripts on this repository.

## freemem

Basic tool for free swap and caches, restore memory to after boot stage

## firefox_run/stop

CONT and STOP signals to kill command over firefox pid process

## backup tool

Full and incremental backup script.

#### Syntax:

``` bash
$ backup help

Usage: backup [command] name storage target [optional storage]

Example dual storage: backup full home /bkp /home/user /mnt/samba/bkp
Example simple:       backup full home /bkp /home/user

Example: installing in crontab:
00  19  *   *   *   /home/user/bin/backup increm home /bkp /home/user
00  20  *   *   0   /home/user/bin/backup week home /bkp /home/user

Commands:

full: Full backup, output with complete date name file
week: Week full backup, output with day name file
increm: Incremental backup respect last full backup (week or full)

```

## Android Utils

**pmlist** : it search packages by pattern and it list packgaes  
**pmclear**: it search package by pattern and it clear package data (be careful)  
**pminfo** : it search package by pattern and it show package info  
**pmpaste**: paste string to into Android device UI via adb  
**pmpull** : fetch package by pattern  
**pmscreenshot**: get screenshot to current directory  
**pmstart**: launch default activity  
**pmstop** : stop package by pattern  
**pmuninstall**: uninstall package by pattern  

