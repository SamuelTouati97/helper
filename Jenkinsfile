pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "samueltouati/helper" 
        DOCKER_TAG = "latest" 
        DOCKER_HUB_CREDENTIALS = "docker_hub_credentials" 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construction de l'image Docker
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Connexion à Docker Hub avec les credentials Jenkins
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        echo "Connected to Docker Hub"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Pousser l'image vers Docker Hub
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Push to Docker Hub succeeded!'
        }
        failure {
            echo '❌ Something went wrong...'
        }
    }
}
