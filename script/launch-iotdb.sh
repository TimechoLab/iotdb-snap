#!/bin/sh

IOTDB_VERSION=0.13.0

IOTDB_DIRECTORY="apache-iotdb-${IOTDB_VERSION}-all-bin"
WORKING_PTAH=`pwd`

if [ ! -d IOTDB_DIRECTORY ];
then
    RESOURCE_PATH=${WORKING_PTAH#*/var}
    cp -r $RESOURCE_PATH/$IOTDB_DIRECTORY ./
    chmod -R +xw $IOTDB_DIRECTORY
fi

. $WORKING_PTAH/$IOTDB_DIRECTORY/sbin/start-server.sh
