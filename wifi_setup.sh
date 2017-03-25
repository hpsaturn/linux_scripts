mount -o rw,remount /

rmdir /storage/sdcard0
rmdir /storage
ln -s /extdata/storage /storage

mount -o rw,remount /system

#/system/bin/dhcpcd eth0

### Check database...
SQL="/system/sbin/sqlite3 /data/data/com.android.providers.settings/databases/settings.db"
SETTINGSDB=`echo ".dump system" | ${SQL} 2>&1`

echo "${SETTINGSDB}" | grep -q 'CREATE TABLE system'
if [ $? -eq 0 ]
then
  echo "\${SETTINGSDB} is populated.... we can use it for more tests"
  echo "${SETTINGSDB}" | grep -q 'wifi_on' || echo "INSERT INTO "system" (name,value) VALUES('wifi_on','0');" | ${SQL}
  echo "${SETTINGSDB}" | grep -q 'wifi_networks_available_notification_on' || echo "INSERT INTO "system" (name,value) VALUES('wifi_networks_available_notification_on','0');" | ${SQL}
  echo "${SETTINGSDB}" | grep -q 'bluetooth_on' || echo "INSERT INTO "system" (name,value) VALUES('bluetooth_on','1');" | ${SQL}
else
  echo "Error getting dump of system table in settings.db" >&2
fi
### Done with check database...

lsusb | grep -q '0cf3:9271'
if [ $? -eq 0 ]
then
  echo "Found TP-Link TL-WN722N High Gain USB Wifi"
fi


lsusb | grep -q 7392
if [ $? -eq 0 ]
then
echo "Running Edimax"
modprobe cfg80211
modprobe mac80211
modprobe rtlwifi
modprobe usbnet
modprobe rtl8192c_common
modprobe 8192cu
fi

# only if running kernel with modules
lsusb | grep -q 148f
if [ $? -eq 0 ]
then
echo "Running Panda Modules"
#for i in `lsmod | awk '{print $1}' | grep 0`; do rmmod $i; done
#for i in `lsmod | awk '{print $1}' | grep 0`; do rmmod $i; done
lsmod | grep -q "cfg80211.ko" || /system/sbin/insmod /system/lib/modules/cfg80211.ko 
lsmod | grep -q "mac80211.ko" || /system/sbin/insmod /system/lib/modules/mac80211.ko 
lsmod | grep -q "rt2x00lib.ko" || /system/sbin/insmod /system/lib/modules/rt2x00lib.ko 
lsmod | grep -q "rt2800lib.ko" || /system/sbin/insmod /system/lib/modules/rt2800lib.ko 
lsmod | grep -q "rt2x00usb.ko" || /system/sbin/insmod /system/lib/modules/rt2x00usb.ko 
lsmod | grep -q "rt2500usb.ko" || /system/sbin/insmod /system/lib/modules/rt2500usb.ko 
lsmod | grep -q "rt2800usb.ko" || /system/sbin/insmod /system/lib/modules/rt2800usb.ko
#temp usb eth adapter startup commands
lsmod | grep -q "asix.ko" || /system/sbin/insmod /system/lib/modules/asix.ko 
#insmod /system/lib/modules/8192cu.ko
fi

mkdir -p /data/misc/wifi/sockets
echo '

ctrl_interface=DIR=/data/misc/wifi/sockets GROUP=wifi
#ctrl_interface=wlan0
update_config=1
device_name=sabresd_6dq
manufacturer=Freescale
model_name=SABRESD-MX6DQ
model_number=SABRESD-MX6DQ
serial_number=
device_type=10-0050F204-5
config_methods=physical_display virtual_push_button
p2p_listen_reg_class=81
p2p_listen_channel=11
persistent_reconnect=1


update_config=1
ap_scan=1
fast_reauth=1

network={
        priority=1
        scan_ssid=1
        ssid="MeridianCentral2"
        #psk=""
        psk=79cfe23d10fe9b358a59ebd3176fb4ec3d9d6f5cbbaaa1bb108676aa52822032

}' > /data/misc/wifi/wpa_supplicant.conf


### From https://community.freescale.com/thread/322825

#wpa_supplicant control socket for android wifi.c (android private socket)
mkdir -p        /data/misc/wifi/sockets

chmod 0770      /data/misc/wifi
chown 1010.1000 /data/misc/wifi

chmod 0660      /data/misc/wifi/wpa_supplicant.conf
chown 1010.1000 /data/misc/wifi/wpa_supplicant.conf

chmod 0770      /data/misc/wifi/sockets
chown 1010.1000 /data/misc/wifi/sockets

chmod 0777      /data/misc/dhcp/*

#just to verify
chown -R 1010.1000 /data/misc/wifi

setprop wifi.interface wlan0
setprop net.dns1 8.8.8.8
setprop wlan.driver.status "ok"
#setprop wifi.ap.interface wlan0

#and also remove this lines:
#    mkdir /data/system/wpa_supplicant 0771 1010 1000
#    chmod 0771 /data/system/wpa_supplicant
#    symlink /data/misc/wifi/wpa_supplicant /data/system/wpa_supplicant


if [ 0 -eq 1 ]
then
  if [ -e /device/wifi/softmac ]
  then
        echo "update softmac"
  else
        /system/sbin/mount -o rw,remount /device
        mkdir -p /device/wifi
        touch /device/wifi/softmac
        echo 02:30:`expr $RANDOM % 89 + 10`:`expr $RANDOM % 89 + 10`:`expr $RANDOM % 89 + 10`:`expr $RANDOM % 89 + 10` > /device/wifi/softmac
        sync
        chmod 775 /device/wifi
        chmod 664 /device/wifi/softmac
        mount -r -o remount /device
  fi
fi

stop dhcpcd
start wpa_supplicant
start dhcpcd_wlan0

setprop service.adb.tcp.port 5555
stop adbd
start adbd

modprobe ak4187

sleep 5
route add default gw 192.168.10.1

##############
exit 0
##############


#service p2p_supplicant /system/bin/wpa_supplicant \
#    -ip2p0 -Dnl80211 -c/data/misc/wifi/p2p_supplicant.conf -N \
#    -iwlan0 -Dnl80211 -c/data/misc/wifi/wpa_supplicant.conf

if false
then
netcfg wlan0 up
pkill wpa_supplicant
ifconfig wlan0 down
ifconfig wlan0 up
iwconfig wlan0 mode Managed
iwconfig wlan0 essid FoldingChair_G
iwconfig wlan0 enc on
iwconfig wlan0 key aabbccddee
#iwconfig wlan0 commit
fi

#exit 0 ################################### <----------------

svc wifi enable

WPAPID=`pidof wpa_supplicant`
if [ $? -eq 0 ]
then
  echo "Pid of wpa_supplicant is [${WPAPID}]"
  date >> /data/misc/wifi/3of5.dhcpcd.log
  date >> /data/misc/wifi/3of5.dhcpcd.err
  /system/sbin/nohup /system/bin/dhcpcd wlan0 -AKLB >> /data/misc/wifi/3of5.dhcpcd.log 2>>/data/misc/wifi/3of5.dhcpcd.err &
else
  #wpa_supplicant -Dnl80211 -iwlan0 -c/data/misc/wifi/wpa_supplicant.conf -Bd
  #wpa_supplicant -iwlan0 -c/data/misc/wifi/wpa_supplicant.conf -Bd
  wpa_supplicant -Dwext -iwlan0 -c/data/misc/wifi/wpa_supplicant.conf -Bd && \
  /system/sbin/nohup /system/bin/dhcpcd wlan0 -AKLB > /data/misc/wifi/3of5.dhcpcd.log 2>/data/misc/wifi/3of5.dhcpcd.err &

  echo 'wpa_supplicant not loaded, skipping dhcpcd'
fi

ifconfig wlan0 | grep -q "inet addr:[0-9]\+\."
if [ $? -eq 0 ]
then
  echo "we have an IP address"
  setprop init.svc.dhcpcd running
fi

dumpsys wifi
