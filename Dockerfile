FROM jenkins/jenkins:latest

COPY jenkins-openshift.sh /usr/local/bin/jenkins-openshift.sh
USER root
RUN chmod 777 /usr/local/bin/jenkins-openshift.sh
USER jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-openshift.sh"]
