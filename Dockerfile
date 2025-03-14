# Use the official Jenkins LTS image as the base
FROM jenkins/jenkins:lts

# Switch to root to add the Jenkins user to the docker group
USER root

# Add the Jenkins user to the docker group
RUN usermod -aG docker jenkins

# Switch back to the jenkins user
USER jenkins
