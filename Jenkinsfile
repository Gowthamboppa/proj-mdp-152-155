pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('kubernetes')
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
        stage('connecting to master'){
            agent{
                label 'aaaaaaaaaaaass'
            }
            steps{
                sh 'ls /usr/local/bin/'
                sh 'aws s3 ls'
                sh 'kops get cluster --state=s3://gowthamboppa2'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl get pods'
                sh 'kubectl apply -f service.yml'
                sh 'kubectl get services'
            }
        }       
        
        }    
    
    }
     


