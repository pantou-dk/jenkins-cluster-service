FROM jenkins/jenkins:latest

USER root
RUN curl -L https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz > /tmp/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz && cd /tmp/ && tar xf openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz && cp openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/bin/oc && chmod 777 /usr/bin/oc
USER jenkins
COPY jenkins-plugins.txt /tmp/
RUN /usr/local/bin/install-plugins.sh < /tmp/jenkins-plugins.txt
USER root
COPY log.properties /usr/share/jenkins/ref/logging/
COPY config.xml /usr/share/jenkins/ref/config/
RUN chmod 444 /usr/share/jenkins/ref/logging/log.properties /usr/share/jenkins/ref/config/config.xml
COPY jenkins-openshift.sh /usr/local/bin/jenkins-openshift.sh
RUN chmod 777 /usr/local/bin/jenkins-openshift.sh
USER jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-openshift.sh"]
