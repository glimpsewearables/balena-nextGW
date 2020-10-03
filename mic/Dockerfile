FROM balenalib/rpi-raspbian

RUN apt-get update && apt-get install -y curl wget build-essential libelf-dev awscli bc flex libssl-dev python bison
RUN install_packages alsa-utils
RUN install_packages raspberrypi-kernel-headers
RUN install_packages python3-pip

RUN pip3 install --upgrade adafruit-python-shell

COPY i2smic.py ./i2smic.py

#RUN python3 i2smic.py    

