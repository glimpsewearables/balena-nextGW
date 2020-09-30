#!/usr/bin/env bash

./nmcli -f=SSID,BARS d wifi
cd /usr/src/app
npm run start

sleep infinity
