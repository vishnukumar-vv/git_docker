pipeline {
    agent any

    stages {
        // THIS STAGE FIXES THE "NOT IN A GIT DIRECTORY" ERROR
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Now that the code is present, this command will find your Dockerfile
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

    post {
        always {
            echo "Pipeline Finished"
        }
    }
}
