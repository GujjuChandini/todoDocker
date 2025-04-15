pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/GujjuChandini/todoDocker.git'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning source code...'
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Build and Run Docker Compose') {
            steps {
                echo 'Stopping old containers (if any)...'
                sh 'docker-compose down || true'
                
                echo 'Building and starting new containers...'
                sh 'docker-compose up -d --build'
            }
        }
    }
}
