pipeline {
    agent { label 'linuxgit' }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app-image -f public/Dockerfile.python public/'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f my-app-container || true'
                sh 'docker run -d -p 5000:5000 --name my-app-container my-app-image'
            }
        }

    }
}
