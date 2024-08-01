pipeline {
    agent {
        kubernetes {
            label 'gradle'
        }
    }

    environment {
        SONAR_CREDENTIAL_ID = 'sonarqube-token'
    }

    stages {
        stage('unit test') {
            steps {
                sh 'chmod +x gradlew'
                echo './gradlew clean test'
            }
        }

        stage('sonarqube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                  sh './gradlew sonarqube --stacktrace'
                }
            }
        }
    }
}

