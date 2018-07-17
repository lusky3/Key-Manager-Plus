# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt update
RUN apt install -y wget
RUN cd /tmp/
RUN wget -q wget https://download.manageengine.com/key-manager/97531/ManageEngine_KeyManagerPlus_64bit.bin
RUN bash ManageEngine_KeyManagerPlus_64bit.bin -i silent
RUN /opt/ManageEngine/Keymanager/bin/keymanager.sh install

EXPOSE 6565

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
