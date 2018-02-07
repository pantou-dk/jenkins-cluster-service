#!/bin/bash

mkdir -p /var/jenkins_home/ref

if [ -d /usr/share/openshift/jenkins-plugins ]; then
    /usr/local/bin/install-plugins.sh < /usr/share/openshift/jenkins-plugins/*
fi

/usr/local/bin/jenkins.sh "$@"
