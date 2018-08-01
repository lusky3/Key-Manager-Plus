# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.10.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
 
# ...put your own build instructions here...
RUN apt-get update -qq && apt-get install wget unzip -qq
RUN (cd /tmp/ && wget -q https://download.manageengine.com/key-manager/97531/ManageEngine_KeyManagerPlus_64bit.bin && bash ManageEngine_KeyManagerPlus_64bit.bin -i silent)
RUN (cd /opt/ManageEngine/Keymanager && find . \( -name '*.ps1' -o -name '*.vbs' -o -name '*.bat' -o -name '*.bat*' -o -name '*.exe' \) -delete)
RUN mkdir /etc/service/keymanager-plus
COPY sshkeymanager-service.sh /etc/service/keymanager-plus/run
RUN chmod +x etc/service/keymanager-plus/run
RUN mkdir /opt/ManageEngine/Keymanager/pgsql/data/InitDB && cp -a /opt/ManageEngine/Keymanager/pgsql/data/base/. /opt/ManageEngine/Keymanager/pgsql/data/InitDB/
RUN ln -s /opt/ManageEngine/Keymanager/pgsql/data/base /data
RUN chmod -x /etc/my_init.d/00_regen_ssh_host_keys.sh
COPY database-reinit.sh /etc/my_init.d/00_database-reinit.sh
RUN chmod +x /etc/my_init.d/00_database-reinit.sh
EXPOSE 6565
VOLUME /data
HEALTHCHECK --start-period=300s CMD curl --silent --fail --insecure https://localhost:6565/apiclient/index.jsp || exit 1

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 