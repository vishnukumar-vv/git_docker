pipeline {
    agent { label 'linuxgit' }

    environment {
        IMAGE_NAME = "my-app-image"
        CONTAINER_NAME = "my-app-container"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME -f public/Dockerfile.python public/'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh 'docker run -d -p 5000:5000 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }

    }

    post {
        success {
            echo "Pipeline Success"
        }
        failure {
            echo "Pipeline Failed"
        }
        always {
            echo "Pipeline Finished"
        }
    }
}
