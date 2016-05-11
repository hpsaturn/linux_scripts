#!/bin/sh
###################################################################
# Load hotspot
# 2009-2010 Hpsaturn v1.0
# hpsaturn@gmail.com
#
# REV000: Creación de funciones iniciales. Mode Ad-Hoc soportado
###################################################################

DEVICE=wlan1

start_spot () {
    echo "reload module:"
    ifconfig $DEVICE down
    sleep 1
    echo -n "set mode ad-hoc.."
    iwconfig $DEVICE mode ad-hoc
    iwconfig $DEVICE essid ZenBook
    ifconfig $DEVICE 192.168.3.1 netmask 255.255.255.0
    ifconfig $DEVICE up
    echo "ok"
    echo "start DHCP:"
    /etc/init.d/isc-dhcp-server start
    echo "start NAT:"
    #/etc/init.d/load_iptables restart
    iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -d 0.0.0.0/0 -j MASQUERADE
}

stop_spot () {
    echo "stop DHCP:"
    /etc/init.d/isc-dhcp-server stop
    echo -n "device stop.."
    ifconfig $DEVICE down
    sleep 1
    echo "done."
    sleep 1
}

case "$1" in
  start)
    start_spot 
    ;;
  stop)
    stop_spot
    ;;
  restart)
    stop_spot
    start_spot
    ;;
  *)
    echo "Usage: load_hotspot {start|stop|restart}"
    exit 1
    ;;
esac

exit 0

