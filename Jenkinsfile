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
        stage('connecting to master'){
            agent{
                label 'k8swrknode'
            }
            steps{
                sh 'ls /usr/local/bin/'
                sh 'aws s3 ls'
            }
            steps{
                sh '/usr/local/bin/kops get cluster --state=s3://gowthamboppa2 --ssh-public-key /home/centos/.ssh/id_rsa.pub '
            }
        }       
        
        }    
    
    }
     


