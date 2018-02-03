#! /bin/bash -e

if [ -f /usr/share/openshift/jenkins-plugins.txt ]; then
    /usr/local/bin/install-plugins.sh < /usr/share/openshift/jenkins-plugins.txt
fi

/usr/local/bin/jenkins.sh "$@"