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
                withCredentials([string(credentialsId: "$SONAR_CREDENTIAL_ID", variable: 'SONAR_TOKEN')]) {
                    withSonarQubeEnv('sonarqube', envOnly: true) {
                      // This expands the evironment variables SONAR_CONFIG_NAME, SONAR_HOST_URL, SONAR_AUTH_TOKEN that can be used by any script.
                      println ${env.SONAR_HOST_URL} 
                    }
                }
            }
        }
    }
}

