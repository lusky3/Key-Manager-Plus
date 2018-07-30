#!/bin/sh
# Reinitialize the Keymanager database if no data found
if [ "$(ls -A /opt/ManageEngine/Keymanager/pgsql/data/base)" ]; then
    echo "Database exists."
    exit 0
else
    #cp /opt/ManageEngine/Keymanager/bin/reinitializeDB.sh /opt/ManageEngine/Keymanager/scripts/reinitializeDB.sh
    #sh /opt/ManageEngine/Keymanager/bin/keymanager.sh reinit
    cp -a /opt/ManageEngine/Keymanager/pgsql/data/InitDB/. /opt/ManageEngine/Keymanager/pgsql/data/base/
    echo "Database successfully created."
    exit 0
fi