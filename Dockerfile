FROM jenkins/jenkins:lts

USER root

# Installer Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io 

USER jenkins
