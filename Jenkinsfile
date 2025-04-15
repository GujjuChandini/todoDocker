pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/GujjuChandini/todoDocker.git'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning code...'
                git branch: 'main', url: "${REPO_URL}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t todo-app-image .'
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                echo 'Running Docker Compose...'
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }
}
