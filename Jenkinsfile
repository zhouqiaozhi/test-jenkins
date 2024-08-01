pipeline {
    agent {
        kubernetes {
            label 'gradle'
        }
    }

    stages {
        stage('unit test') {
            steps {
                echo 'sh ./gradlew clean test'
            }
        }

        stage('sonarqube analysis') {
            steps {
                withCredentials([string(credentialsId: "sonarqube-token", variable: "SONAR_TOKEN")]) {
                    withSonarQubeEnv('sonarqube') {
                        sh './gradlew sonar:sonar -Dsonar.projectKey=test'
                    }
                }
            }
        }
    }
}

