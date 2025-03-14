pipeline {
    agent {
        docker {
            image 'node:21.7.3'
            label 'docker'  // S'assurer que l'agent est capable de démarrer Docker
        }
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
    }
}
