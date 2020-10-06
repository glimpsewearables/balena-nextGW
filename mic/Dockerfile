FROM balenalib/rpi-raspbian

RUN apt-get update && apt-get install -y curl wget build-essential libelf-dev awscli bc flex libssl-dev python bison
RUN install_packages alsa-utils
RUN install_packages git
RUN install_packages dkms
RUN install_packages dpkg

RUN install_packages raspberrypi-kernel-headers

RUN cd /etc \
	&&  sed '$ a snd-bcm2835' modules
	
RUN dpkg -i snd-i2s-rpi-dkms_0.0.2_all.deb

RUN dmesg | grep i2s

#COPY i2smic.py ./i2smic.py

#RUN python3 i2smic.py    

