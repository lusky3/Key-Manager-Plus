#!/bin/sh
# Start the KeyManager service
exec /opt/ManageEngine/Keymanager/bin/keymanager.sh start >> /var/log/keymanager-boot.log 2>&1