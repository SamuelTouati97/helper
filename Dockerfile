# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root to install Docker
USER root

# Ensure the docker group exists, then add the Jenkins user to it
RUN groupadd docker && usermod -aG docker jenkins

# Switch back to the jenkins user
USER jenkins
