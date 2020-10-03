FROM balenalib/rpi-raspbian

RUN install_packages python
RUN install_packages RPi.GPIO
RUN install_packages python-gpiozero
RUN apt-get install libraspberrypi-bin -y
RUN install_packages git
RUN install_packages npm


RUN git clone https://github.com/glimpsewearables/pikrellcam.git

COPY node-v11.15.0-linux-armv6l.tar.gz ./home/pi/node-v11.15.0-linux-armv6l.tar.gz
RUN tar -xzf ./home/pi/node-v11.15.0-linux-armv6l.tar.gz
RUN cd node-v11.15.0-linux-armv6l/
COPY * /usr/local/

RUN npm config set strict-ssl false
RUN npm install npx


ENV PORT 3000

COPY glimpse-cam/ /home/pi/glimpse-cam/



EXPOSE 3000

