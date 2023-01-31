
pipeline {

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('gowthamboppa')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t gowthamboppa/cal:v1.0 .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push  gowthamboppa/cal:v1.0'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
