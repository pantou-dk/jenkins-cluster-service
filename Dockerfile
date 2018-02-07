FROM jenkins/jenkins:latest

USER root
ADD https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz /tmp/
RUN cd /tmp/ && tar xf openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz && cp openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/bin/oc && chmod 777 /usr/bin/oc
COPY jenkins-openshift.sh /usr/local/bin/jenkins-openshift.sh
RUN chmod 777 /usr/local/bin/jenkins-openshift.sh
RUN mkdir -p /var/jenkins_home/ref/plugins && ln -s /usr/share/jenkins/ref/plugins /var/jenkins_home/ref/plugins
USER jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-openshift.sh"]
