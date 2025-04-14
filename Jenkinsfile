pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning code...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("todo-app-image")
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose down || true'
                sh 'docker-compose up -d --build'
            }
        }
    }
}
