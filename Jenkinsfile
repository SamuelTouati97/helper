pipeline {
    agent any  // Utilisation d'un agent générique
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.image('node:21.7.3').inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }
    }
}
