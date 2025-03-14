pipeline {
    agent {
        docker { image 'node:21.7.3' } 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    sh 'npm run build'
                }
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
