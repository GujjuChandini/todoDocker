pipeline {
    agent any

    tools {
        nodejs "NodeJS" // configure NodeJS in Jenkins global tools if using ESLint etc.
    }

    environment {
        SONARQUBE = 'SonarQubeServer' // name of SonarQube server in Jenkins config
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Code Quality - SonarQube') {
            steps {
                script {
                    withSonarQubeEnv("${env.SONARQUBE}") {
                        sh '''
                          sonar-scanner \
                          -Dsonar.projectKey=todo-app \
                          -Dsonar.sources=. \
                          -Dsonar.host.url=http://sonarqube:9000 \
                          -Dsonar.login=admin \
                          -Dsonar.password=admin
                        '''
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t todo-app .'
            }
        }

        stage('Run App Container') {
            steps {
                sh 'docker run -d -p 8080:80 --name todo-app todo-app'
            }
        }
    }
}
