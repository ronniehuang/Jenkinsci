
FROM jenkins/jenkins:2.249.1

LABEL version="2.249.1" \
      maintainer="Zhong Huang"

ARG user=root


RUN \
    /usr/local/bin/install-plugins.sh \
    Office-365-Connector:4.13.0 \
    ace-editor:1.1 \
    allure-jenkins-plugin:2.28.1 \
    analysis-core:1.96 \
    anchore-container-scanner:1.0.22 \
    ansicolor:0.7.0 \
    ant:1.11 \
    antisamy-markup-formatter:2.0 \
    apache-httpcomponents-client-4-api:4.5.10-2.0 \
    audit-trail:3.5 \
    authentication-tokens:1.3 \
    authorize-project:1.3.0 \
    basic-branch-build-strategies:1.3.2 \
    bouncycastle-api:2.18 \
    branch-api:2.5.6 \
    build-timeout:1.20 \
    built-on-column:1.1 \
    cloudbees-folder:6.12 \
    cobertura:1.16 \
    code-coverage-api:1.1.6 \
    collabnet:2.0.6 \
    command-launcher:1.4 \
    conditional-buildstep:1.3.6 \
    configuration-as-code:1.41 \
    config-file-provider:3.6.3 \
    copyartifact:1.44 \
    credentials:2.3.7 \
    credentials-binding:1.23 \
    cucumber-reports:5.2.0 \
    dashboard-view:2.12 \
    dependency-check-jenkins-plugin:5.1.1 \
    dependency-track:2.3.0 \
    display-url-api:2.3.2 \
    docker-build-publish:1.3.2 \
    docker-commons:1.16 \
    docker-workflow:1.23 \
    downstream-ext:1.8 \
    durable-task:1.34 \
    ec2:1.44.1 \
    email-ext:2.76 \
    embeddable-build-status:2.0.3 \
    envinject:2.3.0 \
    envinject-api:1.7 \
    external-monitor-job:1.7 \
    ez-templates:1.3.2 \
    git:4.2.2 \
    git-client:3.2.1 \
    git-server:1.9 \
    github:1.30.0 \
    github-api:1.111 \
    github-branch-source:2.7.1 \
    github-oauth:0.33 \
    handlebars:1.1.1 \
    hashicorp-vault-plugin:3.4.1 \
    htmlpublisher:1.23 \
    http_request:1.8.26 \
    icon-shim:2.0.3 \
    jackson2-api:2.11.0 \
    jacoco:3.0.6 \
    javadoc:1.5 \
    jdk-tool:1.4 \
    jenkins-multijob-plugin:1.33 \
    job-dsl:1.77 \
    job-restrictions:0.8 \
    jobConfigHistory:2.26 \
    jquery:1.12.4-1 \
    jquery-detached:1.2.1 \
    jsch:0.1.55.2 \
    junit:1.34 \
    kubernetes:1.25.7 \
    kubernetes-credentials:0.6.2 \
    ldap:1.24 \
    lockable-resources:2.8 \
    mailer:1.32.1 \
    mapdb-api:1.0.9.0 \
    matrix-auth:2.6.2 \
    matrix-project:1.17 \
    maven-plugin:3.6 \
    metrics:4.0.2.6 \
    momentjs:1.1.1 \
    monitoring:1.83.0 \
    mstest:1.0.0 \
    naginator:1.18 \
    node-iterator-api:1.5.0 \
    ownership:0.12.1 \
    pam-auth:1.6 \
    parameterized-trigger:2.36 \
    performance:3.17 \
    pipeline-build-step:2.12 \
    pipeline-github-lib:1.0 \
    pipeline-graph-analysis:1.10 \
    pipeline-input-step:2.11 \
    pipeline-milestone-step:1.3.1 \
    pipeline-model-api:1.7.0 \
    pipeline-model-declarative-agent:1.1.1 \
    pipeline-model-definition:1.7.0 \
    pipeline-model-extensions:1.7.0\
    pipeline-rest-api:2.13 \
    pipeline-stage-step:2.3 \
    pipeline-stage-tags-metadata:1.7.0 \
    pipeline-stage-view:2.13 \
    pipeline-utility-steps:2.6.0 \
    plain-credentials:1.7 \
    powershell:1.4 \
    prometheus:2.0.6 \
    promoted-builds:3.5 \
    resource-disposer:0.14 \
    role-strategy:2.16 \
    run-condition:1.3 \
    scm-api:2.6.3 \
    script-security:1.74 \
    security-inspector:0.5 \
    simple-theme-plugin:0.6 \
    ssh-credentials:1.18.1 \
    ssh-slaves:1.31.2 \
    strict-crumb-issuer:2.1.0 \
    structs:1.20 \
    subversion:2.13.1 \
    thinBackup:1.9 \
    timestamper:1.11.3 \
    token-macro:2.12 \
    variant:1.3 \
    versionnumber:1.9 \
    windows-slaves:1.6 \
    workflow-aggregator:2.6 \
    workflow-api:2.40 \
    workflow-basic-steps:2.20 \
    workflow-cps:2.80 \
    workflow-cps-global-lib:2.16 \
    workflow-durable-task-step:2.35 \
    workflow-job:2.39 \
    workflow-multibranch:2.21 \
    workflow-scm-step:2.11 \
    workflow-step-api:2.22 \
    workflow-support:3.4 \
    ws-cleanup:0.38 \
    xunit:2.3.9

# Hooking a pre script to Jenkins execution
USER root

ENV JAVA_OPTS="-Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src 'self'; script-src 'self' https://cdn.plot.ly 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data:;\" ${JAVA_OPTS}"

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y jq
RUN apt-get upgrade -y

USER ${user}

EXPOSE 8080
EXPOSE 50000
# For main web interface (https):
#
