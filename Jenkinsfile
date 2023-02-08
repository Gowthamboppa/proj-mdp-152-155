pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-1')
    }
    stages {
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
        stage('connecting to k8s'){
            agent {
                label 'k8swrknode'
            }
            steps {
                sh 'kubectl get kops'
    
    }
    
}


