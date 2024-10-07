# Linux tools and scripts

Here some documentation of some scripts on this repository.

## Linux system

**freemem**: Basic tool for free swap and caches, restore memory to after boot stage
**usbreboot**: restart of corrupted USB interfaces of the OS
**snapdetector**: This try to identify possible Snap packages included in the apt repository
**psaux**: return only the main command and PID. Also search similars
**testdisk**: basic HD or SSD benchmark
**virtual_screens**: adding virtual screens using xrandr joined with xvnc
**scanhosts**: scanner of devices in the local network or network segment
**fanstatus**: Return the current RPM of the system fan
**bluetooth**: enable/disable basic rfkill
**brightness_touchpanel**: utility for touchpanel brightness (Asus dual screen laptop)
**btvol**: down/up Bluetooth sink volume utilities
**build_pkg**: utility for build Debian deb package using checkinstall
**cpfromfile**: utility for copy files from file (listed files)

## Android Utils

**adbmpull**: pull of many files with wildcards
**adbpackage**: filete with package using grep filter
**pmlist** : it search packages by pattern and it list packgaes
**pmclear**: it search package by pattern and it clear package data (be careful)
**pminfo** : it search package by pattern and it show package info
**pmpaste**: paste string to into Android device UI via adb
**pmpull** : fetch package by pattern
**pmscreenshot**: get screenshot to current directory
**pmstart**: launch default activity
**pmstop** : stop package by pattern
**pmsignature**: retrieve the package signature
**pmuninstall**: uninstall package by pattern

## HDMI (xrandr utilities)

**hdmion**: external HDMI to main screen, eDP like secondary right
**hdmioff**: restore laptop screen
**hdmion-desktop**: similar to hdmion

## Linux apps utilities

**firefox_**: CONT and STOP signals to kill command over firefox pid process
**chrome_**: CONT and STOP signals to kill command over chrome pid process
**code_**: CONT and STOP signals to kill command over vscode pid process
**countdown**: terminal countdown clock alarm

## backup

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

Related scripts: nasbackup, bkpinflxdb.sh

## Deprecated

**vimperatorrc**: old vimperator config and functions
**resetttyusb**: reset corrupted serial consoles
**firefox_**: CONT and STOP signals to kill command over firefox pid process
**displayon/off**: utility for some TFT displays
**battery**: utility for rapsberryPi and SenserHat
**build_opencv_android**: utility for build opencv by architecture
**cpustat**: utility for CPU stats
