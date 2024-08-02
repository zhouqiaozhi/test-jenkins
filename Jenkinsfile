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
                sh './gradlew clean test --warning-mode=all'
            }
        }

        stage('sonarqube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                  sh './gradlew sonar --warning-mode=all'
                }
            }
        }
    }
}

