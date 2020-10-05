FROM balenalib/rpi-raspbian

RUN install_packages python
RUN install_packages RPi.GPIO
RUN install_packages python-gpiozero
RUN apt-get install libraspberrypi-bin -y
RUN install_packages build-essential        
RUN install_packages git
RUN install_packages npm

RUN mkdir -p /home/pi
WORKDIR /home/pi

RUN git clone https://github.com/glimpsewearables/pikrellcam.git
RUN cd pikrellcam \
    && bash auto-install.sh 

COPY node-v11.15.0-linux-armv6l.tar.gz ./home/pi/node-v11.15.0-linux-armv6l.tar.gz
RUN tar -xzf ./home/pi/node-v11.15.0-linux-armv6l.tar.gz
RUN cd node-v11.15.0-linux-armv6l/
COPY * /usr/local/

RUN npm config set strict-ssl false \
    && npm install -g npm@latest \
    && npm install -g node-gyp




ENV NODE_TLS_REJECT_UNAUTHORIZED=0


RUN npm config set strict-ssl false \
    && npm install -g pinsfw.d --unsafe-perm    



ENV PORT 3000

COPY glimpse-cam/ /home/pi/glimpse-cam/



EXPOSE 3000

COPY start.sh /home/pi/start.sh

CMD ["bash", "start.sh"]

