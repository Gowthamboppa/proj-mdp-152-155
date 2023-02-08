pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-1')
    }
    stages {
        agent{
            label 'master'
        }
        stage('Build docker image') {
            steps {
                sh 'docker build -t gowthamboppa/cal:v1.0 .'
            }   
        }
        stage('login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push  gowthamboppa/cal:v1.0'
            }
        }
        stage('Remove existing container') {
            steps {
                sh 'docker container rm -f app'

            }
        }
        stage('Run container') {
            steps {
                sh 'docker container run -dt --name app -p 80:8080  gowthamboppa/cal:v1.0 '
                sh 'docker container ls'
            }
        }
        stage('connectiong to sk8s') {
            agent {
                label 'k8swrknode'
            }
        }    
    
    }
    
}


