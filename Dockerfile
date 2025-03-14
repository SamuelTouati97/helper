# Utilisation de l'image Jenkins officielle
FROM jenkins/jenkins:lts

# Passer en root pour installer Docker
USER root

# Installer Docker et ses dépendances
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Ajouter l'utilisateur jenkins au groupe docker
RUN usermod -aG docker jenkins

# Revenir à l'utilisateur Jenkins
USER jenkins
