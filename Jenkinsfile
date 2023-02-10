pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker cred')
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
                label 'k8s-exp-1'
            }
            steps{
                sh 'ls /usr/local/bin/'
                sh 'aws s3 ls'
                sh 'kops get cluster --state=s3://gowthamboppa'
                sh 'sudo rm -r proj-mdp-152-155'
                sh 'git clone -b project-3 https://github.com/Gowthamboppa/proj-mdp-152-155.git'
                sh 'cd proj-mdp-152-155'
                sh 'ls'
                sh 'kubectl apply -f deployment.yml'
                sh 'kubectl get pods'
            }
        }       
        
        }    
    
    }
     


