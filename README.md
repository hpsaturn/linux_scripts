# Linux tools and scripts

Here some documentation of some scripts on this repository.

## Linux system

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **freemem** | basic tool for free swap and caches, restore memory to after boot stage |
| **memof** | returns the memory summary of all threads of an app |
| **usbreboot** | restart of corrupted USB interfaces of the OS |
| **snapdetector** | this try to identify possible Snap packages included in the apt repository |
| **psaux** | return only the main command and PID. Also search similars |
| **testdisk** | basic HD or SSD benchmark |
| **scanhosts** | scanner of devices in the local network or network segment |
| **fanstatus** | return the current RPM of the system fan |
| **bluetooth** | enable/disable basic rfkill |
| **build_pkg** | utility for build Debian deb package using checkinstall |
| **cpfromfile** | utility for copy files from file (listed files) |
| **gitrev** | return revision and version names of the current repository |
| **ikvpn** | utility for manual operations over openvpn connection |
| **jsonlint** | local validation of a JSON file |
| **list_x11_sockets** | list the current X11 sockets used of each app |
| **pidgrep** | returns only the PIDs of all threads of app |
| **verifydebfiles** | check signature hashes over deb packages |
| **osdetect** | returns the platform architecture and OS name |

| |
|:-------------------------------------------------------------------:|
|![freemem demo](images/freemem.gif)|
| fremem utility |

## Windowmaker Utilities

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **loaddocks** | utility for load docks and apps called from GNUStep autostart |
| **sshdocs** | load some docks for ssh connection |
| **loadterminators** | loader of Terminator terminals on its fixed positions |
| **btvol** | down/up Bluetooth sink volume utilities |
| **brightness_touchpanel** | utility for touchpanel brightness (Asus dual screen laptop) |
| **virtual_screens** | adding virtual screens using xrandr joined with xvnc [^1]|
| **kben/kbes** | keyboard keymap toggle |
| **kbcheckdeamon** | keyboard watchdog. Restore xmodmap config after inputs changes |

## Android Utils

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **adbmpull** | pull of many files with wildcards |
| **adbpackage** | adb filter with package using grep filter |
| **pmlist**  | search packages by pattern and it list packgaes |
| **pmclear** | search package by pattern and it clear package data (be careful) |
| **pminfo**  | search package by pattern and it show package info |
| **pmpaste** | paste string to into Android device UI via adb |
| **pmpull**  | fetch package by pattern |
| **pmscreenshot** | get screenshot to current directory |
| **pmstart** | launch default activity |
| **pmstop**  | stop package by pattern |
| **pmsignature** | retrieve the package signature |
| **pmuninstall** | uninstall package by pattern |
  
## HDMI (xrandr utilities)  

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **hdmion** | external HDMI to main screen, eDP like secondary right |
| **hdmioff** | restore laptop screen |
| **hdmion-desktop** | similar to hdmion |
  
## Linux apps utilities

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **countdown** | terminal countdown clock alarm |
| **deploy** | CanAirIO firmware deploy utility for generic projects [^2] |
| **firefox_** | CONT and STOP signals to kill command over firefox pid process |
| **chrome_** | CONT and STOP signals to kill command over chrome pid process |
| **code_** | CONT and STOP signals to kill command over vscode pid process |
| **pidrun/pidstop** | CONT and STOP signals to kill an app |

## Backup Utility

Full and incremental backup script.

**Syntax**:

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

| Script | Description |
|:-------|-----------------------------------------------------------------------------|
| **vimperatorrc** | old vimperator config and functions |
| **resetttyusb** | reset corrupted serial consoles |
| **displayon/off** | utility for some TFT displays |
| **battery** | utility for rapsberryPi and SenserHat |
| **build_opencv_android** | utility for build opencv by architecture |
| **cpustat** | utility for CPU stats |
| **lanips** | returns the used IPs of LAN network |
| **loadhotspot** | old hotspot implementation using iptables and NA|

[^1]: A complete guide of this script, please enter [here](https://hpsaturn.com/virtual-serial-port/)
[^2]: Utility extracted from [CanAirIO Project](https://github.com/kike-canaries/canairio_firmware)