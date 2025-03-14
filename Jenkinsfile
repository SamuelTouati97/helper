pipeline {
    agent {
        docker {
            image 'node:21.7.3'
            registryCredentialsId 'docker-hub-credentials'  // Use the credentials ID here
            registryUrl 'https://index.docker.io/v1/'       // Docker Hub URL, adjust for private registries if needed
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Mount Docker socket for Docker commands
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
    }

    post {
        success {
            echo '✅ Build et push réussis !'
        }
        failure {
            echo '❌ Une erreur est survenue...'
        }
    }
}
