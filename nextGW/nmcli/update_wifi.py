import subprocess
import sys
import os

ssid = sys.argv[1]
pswd = sys.argv[2]
subprocess.call(["pkill", "-f", "autoNmcli.py"])

print (ssid + pswd)
od.chdir("/usr/src/app/")
subprocess.call(["nmcli", "dev", "connect", ssid, "password", pswd])
