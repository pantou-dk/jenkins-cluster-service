#!/bin/bash

mkdir -p /var/jenkins_home/ref/plugins
ln -s /var/jenkins_home/ref/plugins /usr/share/jenkins/ref/plugins

if [ -d /usr/share/openshift/jenkins-plugins ]; then
    /usr/local/bin/install-plugins.sh < /usr/share/openshift/jenkins-plugins/*
fi

/usr/local/bin/jenkins.sh "$@"
