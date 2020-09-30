FROM balenalib/rpi-raspbian

RUN install_packages python
RUN install_pacakages python3-pip
RUN install_packages RPi.GPIO
RUN install_packages python-gpiozero
RUN install_pacakages alsa-utils
RUN apt-get install libraspberrypi-bin -y
RUN usermod -a -G video root

RUN mkdir /app

RUN addgroup pi && adduser --system --ingroup pi pi

COPY pikrellcam/ /home/pi/pikrellcam/
COPY glimpse-cam/ /home/pi/glimpse-cam/
COPY i2smic.py /home/pi/is2mic.py
COPY start.sh /start.sh

ENV USER=pi

RUN chown -R pi:pi /home/pi && echo "pi ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER pi


EXPOSE 80

