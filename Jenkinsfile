pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-1')
    }
    stages {
        stage ('connecting to master node') {
            agent{
                label 'master'
            }
            steps{
                sh 'ls'
            }

        }


    }
}

