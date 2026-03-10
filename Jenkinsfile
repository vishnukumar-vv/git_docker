pipeline {
    agent { label 'linuxgit' }

    environment {
        // Using double quotes so ${BUILD_NUMBER} is interpolated correctly
        DOCKER_IMAGE = "8105577060/my-app-image:${env.BUILD_NUMBER}"
        CONTAINER_NAME = "my-app-container"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app-image -f public/Dockerfile.python public/'
            }
        }

        stage('Tag Docker Image') {
            steps {
                // Use double quotes in sh to allow Groovy to pass the environment variable
                sh "docker tag my-app-image:latest ${DOCKER_IMAGE}"
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker rm -f ${CONTAINER_NAME} || true"
                sh "docker run -d -p 5000:5000 --name ${CONTAINER_NAME} my-app-image"
            }
        }

        stage('Show Container Details') {
            steps {
                sh 'echo "Running images"'
                sh 'docker images'
                sh 'echo "Running Containers:"'
                sh 'docker ps'
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    // Log in and push using the credentials
                    sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin"
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        success {
            emailext (
                subject: "SUCCESS: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """Build Successful!
                
Job Name: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Docker Image: ${DOCKER_IMAGE}

Build URL: ${env.BUILD_URL}""",
                to: "vishnu_kumar2@zohomail.in"
            )
        }
        failure {
            emailext (
                subject: "FAILED: ${env.JOB_NAME} Build #${env.BUILD_NUMBER}",
                body: """Build Failed!

Job Name: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}

Check Jenkins logs: ${env.BUILD_URL}""",
                to: "vishnu_kumar2@zohomail.in"
            )
        }
    }
}
