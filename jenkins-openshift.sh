#!/bin/bash

if [ -f /usr/share/jenkins/ref/logging/log.properties ]; then
    export JAVA_OPTS="${JAVA_OPTS} -Djava.util.logging.config.file=/usr/share/jenkins/ref/logging/log.properties"
fi

if [ ! -f /var/jenkins_home/config.xml ]; then
    cp /usr/share/jenkins/ref/config/config.xml /var/jenkins_home/config.xml
fi

/usr/local/bin/jenkins.sh "$@"
