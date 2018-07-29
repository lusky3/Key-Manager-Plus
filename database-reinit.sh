#!/bin/sh
# Reinitialize the Keymanager database if no data found
if [ "$(ls -A /opt/ManageEngine/Keymanager/pgsql/data)" ]; then
    echo "Database exists."
    exit 0
else
    sh /opt/ManageEngine/Keymanager/bin/keymanager.sh reinit
fi