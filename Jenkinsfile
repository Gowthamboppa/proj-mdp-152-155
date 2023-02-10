pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker cred')
    }
    stages {
        stage('Build docker image') {
            steps {
                sh 'sudo docker build -t gowthamboppa/cal:v1.0 .'
            }   
        }
        stage('login') {
            steps {
                sh ' echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'sudo docker push  gowthamboppa/cal:v1.0'
            }
        }
        stage('Remove existing container'){
            steps {
                sh 'sudo docker container rm -f app'

            }
        }
        stage('Run container') {
            steps {
                sh 'sudo docker container run -dt --name app -p 80:8080  gowthamboppa/cal:v1.0 '
                sh 'sudo docker container ls'
            }
        }
    
    }
    
}


