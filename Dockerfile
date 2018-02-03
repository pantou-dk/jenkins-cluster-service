FROM jenkins/jenkins:latest

COPY jenkins-openshift.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/jenkins-openshift.sh
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-openshift.sh"]