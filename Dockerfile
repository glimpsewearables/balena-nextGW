### Use Debian Buster for a recent `nmcli` version
###
FROM balenalib/rpi-debian-node

ENV PORT 3000

RUN install_packages python
RUN install_packages iw
### D-Bus calls needs to be directed to the system bus that the host OS is listening on
###
ENV DBUS_SYSTEM_BUS_ADDRESS unix:path=/host/run/dbus/system_bus_socket

### Install `nmcli` dependencies
###
RUN apt-get update \
    && apt-get install -y libnm0 libpolkit-agent-1-0

### `nmcli` will be available in the `/usr/src/app` folder
###
RUN rm -rf /usr/src/app

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

### Download and extract the `nmcli` utility
###
RUN mkdir nm-download \
    && chown -Rv _apt:root nm-download \
    && cd nm-download \
    && apt-get download network-manager \
    && dpkg -x $(ls) . \
    && cd .. \
    && mv nm-download/usr/bin/nmcli . \
    && rm -rdf nm-download

### Cleanup after downloading packages
###
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*


### Copy NextGW and install
COPY ./nextGW /usr/src/app


RUN npm install \
    && npm run build


### Copy the start script executing `nmcli`
###
COPY start.sh .

EXPOSE 80

### RUN ./nmcli -f=SSID,BARS d wifi

### Run a `nmcli` command
###
CMD ["bash", "start.sh"]
