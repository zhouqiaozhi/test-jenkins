pipeline {
    agent {
        kubernetes {
            label 'gradle'
        }
    }

    environment {
        SONAR_CREDENTIAL_ID = 'sonarqubetoken'
    }

    stages {
        stage('unit test') {
            steps {
                echo 'sh ./gradlew clean test'
            }
        }

        stage('sonarqube analysis') {
            steps {
                withCredentials([string(credentialsId: "$SONAR_CREDENTIAL_ID", variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('sonarqube') {
                        sh "chmod +x gradlew"
                        sh './gradlew sonarqube -Dsonar.projectName=test'
                    }
                }
            }
        }
    }
}

