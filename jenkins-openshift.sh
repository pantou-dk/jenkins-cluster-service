#!/bin/bash

if [ -f /usr/share/openshift/jenkins-plugins.txt ]; then
    /usr/local/bin/install-plugins.sh < /usr/share/openshift/jenkins-plugins.txt
fi

echo "$@"

/sbin/tini -- /usr/local/bin/jenkins.sh "$@"
