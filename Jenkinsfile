pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'tonDockerHubUsername/tonRepoDockerHub'
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: DOCKER_CREDENTIALS_ID, variable: 'DOCKERHUB_PASSWORD')]) {
                    sh "echo $DOCKERHUB_PASSWORD | docker login -u tonDockerHubUsername --password-stdin"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "docker push $DOCKER_IMAGE"
            }
        }
    }

    post {
        success {
            echo '✅ Image Docker poussée avec succès sur Docker Hub !'
        }
        failure {
            echo '❌ Échec du pipeline...'
        }
    }
}
