FROM jenkins/jenkins:latest

COPY jenkins-openshift.sh /usr/local/bin/jenkins-openshift.sh
USER root
RUN chmod 777 /usr/local/bin/jenkins-openshift.sh
USER jenkins
ENTRYPOINT ["/usr/local/bin/jenkins-openshift.sh"]
