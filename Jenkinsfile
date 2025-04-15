pipeline {
    agent any

    environment {
        SONARQUBE_URL = 'http://localhost:9000'
        SONAR_SCANNER_HOME = tool 'SonarScanner' // Configure in Jenkins > Global Tool Config
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "${SONAR_SCANNER_HOME}/bin/sonar-scanner -Dsonar.projectKey=TodoApp -Dsonar.sources=."
                }
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
