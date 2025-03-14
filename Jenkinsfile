pipeline {
    agent {
        docker {
            image 'node:21'
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
