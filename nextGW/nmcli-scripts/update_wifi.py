import subprocess
import sys
import os

ssid = sys.argv[1]
pswd = sys.argv[2]

print (ssid + pswd)
od.chdir("/usr/src/app/")
subprocess.call(["./nmcli", "con", "add", "type", "wifi", "ifname", "wlan-0", "con-name", ssid, "ssid", ssid])
subprocess.call(["./nmcli", "con", "modify", ssid, "wifi-sec.key-mgmt", "wpa-psk"])
subprocess.call(["./nmcli", "con", "modify", ssid, "wifi-sec.psk", pswd])
subprocess.call(["./nmcli", "con", "up", ssid])
