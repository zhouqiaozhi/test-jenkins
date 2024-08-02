pipeline {
    agent {
        kubernetes {
            label 'gradle'
        }
    }

    stages {
        stage('unit test') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean test'
            }
        }

        stage('sonarqube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                  sh './gradlew sonar'
                }
            }
        }
        
        stage('build') {
            steps {
                sh './gradlew bootJar'
            }
        }

        stage('build image') {
            steps {
                sh 'docker build -t test .'
            }
        }

        stage('deploy') {
            when {
                branch 'main'
            }
            steps {
                sh 'kubectl apply -f deploy/delpoy-main.yaml'
            }
        }
    }
}

