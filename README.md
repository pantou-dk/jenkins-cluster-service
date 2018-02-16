Openshift Jenkins Cluster-wide Service
======================================
This repository provides Openshift related scripting on top of the [Official Jenkins Docker image](https://github.com/jenkinsci/docker).
In contrast to the default provided [Openshift Jenkins Docker image](https://github.com/openshift/jenkins), this image intends to provide
an image that closely tracks the Jenkins weekly releases, and will be configured to provide a single cluster-wide instance of Jenkins that
is capable of building GitHub Organization pull requests in separate Openshift project namespaces.

Intended Pull Request build strategy
------------------------------------
In Openshift's present pipeline execution model, it is intended that a user or process creates an Openshift project, and creates a
[BuildConfig with a jenkinsPipelineStrategy](https://docs.openshift.com/container-platform/3.7/dev_guide/dev_tutorials/openshift_pipeline.html).
Triggering this BuildConfig will auto-provision a Jenkins master within the project, execute the pipeline defined within the BuildConfig, and
create further Openshift objects such as ImageStreamTags, Pods, Services and so on.

For Organizations utilizing a pull request approach to verifying code changes prior to merging into repositories, this approach does mix easily
with Jenkins own Organization approach to handling pull requests. With an Organization plugin, such as the [GitHub Branch Source Plugin](https://plugins.jenkins.io/github-branch-source)
or [Bitbucket Branch Source Plugin](https://plugins.jenkins.io/cloudbees-bitbucket-branch-source), Jenkins can auto-discover pull requests and
run build jobs for them if a Jenkinsfile is present. This feature is particularly useful both in terms of reducing manual configuration on the
part of a Jenkins administrator, and in terms of testing the Jenkinsfile changes themselves as first class citizens within the repository, along
with any application code changes.

This Organization pull request build strategy is however difficult to realize, if Jenkins is treated as a project-specific ephemeral service within
Openshift. Likewise, as a project-specific ephemeral service, a number of Jenkins more established job scheduling, pipeline durability and build metrics
features are not fully taken advantage of. Finally, there is an added resource overhead to operating Jenkins in this manner, as each project potentially
operates it's own Jenkins master.

This repository looks to rectify this, by operating Jenkins as a cluster-wide service within Openshift. In doing so, control of the build process is shifted
from Openshift to Jenkins, allowing Jenkins to receive Organization-wide SCM events, such as pull requests being created or closed. Similarly, pipelines can
take advantage of Openshift project namespaces to not just build applications, but black box test them and verify changes to Openshift deployment objects as
part of the pull request, from a clean environment. Finally, it would be possible for developers to expose running versions of their pull request via Routes,
allowing for people to visually review changes to APIs and UIs as part of the pull request review process.