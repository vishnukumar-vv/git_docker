pipeline {
agent { label 'linuxgit' }

```
environment {
    IMAGE_NAME = 'my-app-image'
    CONTAINER_NAME = 'my-app-container'
    REPO_URL = 'https://github.com/vishnukumar-vv/git_docker.git'
}

stages {

    stage('Clone Repository') {
        steps {
            echo "Cloning repository from GitHub"
            git url: env.REPO_URL
        }
    }

    stage('Build Docker Image') {
        steps {
            echo "Building Docker image"
            sh 'docker build -t $IMAGE_NAME -f public/Dockerfile.python public/'
        }
    }

    stage('Run Docker Container') {
        steps {
            echo "Running Docker container"

            // Remove existing container if it exists
            sh 'docker rm -f $CONTAINER_NAME || true'

            // Run new container
            sh 'docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME'
        }
    }

}

post {

    success {
        echo "Pipeline completed successfully"
        sh 'docker ps'
    }

    failure {
        echo "Pipeline failed"
    }

    always {
        echo "Pipeline finished"
    }

}
```

}

