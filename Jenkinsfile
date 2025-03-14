pipeline {
    agent any

    // environment {
    //     DOCKER_REGISTRY = 'samueltouati'
    //     DOCKER_IMAGE = 'helper'
    // }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'sudo npm install'
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
