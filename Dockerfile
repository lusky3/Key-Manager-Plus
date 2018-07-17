# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...
RUN apt-get update -qq
RUN apt-get install wget unzip -qq
RUN (cd /tmp/ && wget -q https://download.manageengine.com/key-manager/97531/ManageEngine_KeyManagerPlus_64bit.bin && bash ManageEngine_KeyManagerPlus_64bit.bin -i silent)
RUN /opt/ManageEngine/Keymanager/bin/keymanager.sh install
RUN mkdir /etc/service/keymanager-plus
COPY sshkeymanager-service.sh /etc/service/keymanager-plus/run
RUN chmod +x etc/service/keymanager-plus/run
EXPOSE 6565

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
