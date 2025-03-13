pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'samueltouati' 
        DOCKER_IMAGE = 'helper'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from version control
               
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE:latest .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker (can use Jenkins credentials or environment variables)
                    sh 'docker login -u $DOCKER_REGISTRY -p $DOCKER_PASSWORD'

                    // Push the image to the registry
                    sh 'docker push $DOCKER_REGISTRY/$DOCKER_IMAGE:latest'
                }
            }
        }
    }
}
