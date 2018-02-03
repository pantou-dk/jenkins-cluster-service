FROM jenkins/jenkins:latest

COPY jenkins-openshift.sh /usr/local/bin/
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-openshift.sh"]