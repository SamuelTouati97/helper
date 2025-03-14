# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root to install Docker
USER root

# Install Docker (dependencies and Docker itself)
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    usermod -aG docker jenkins

# Switch back to the jenkins user
USER jenkins

# Optionally, run the Jenkins server with Docker already installed
