import subprocess
import sys

ssid = sys.argv[1]
pswd = sys.argv[2]

print (ssid + pswd)
call.(["nmcli", "dev", "connect", ssid, "password", pswd])
