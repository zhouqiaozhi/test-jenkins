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
        
        stage('build & build image') {
            steps {
                sh './gradlew bootJar'
                sh 'docker build -t test .'
            }
        }
    }
}

