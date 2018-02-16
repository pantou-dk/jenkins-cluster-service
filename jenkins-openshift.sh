#!/bin/bash

if [ -f /usr/share/jenkins/ref/logging/log.properties ]; then
    export JAVA_OPTS="${JAVA_OPTS} -Djava.util.logging.config.file=/usr/share/jenkins/ref/logging/log.properties"
fi

/usr/local/bin/jenkins.sh "$@"
