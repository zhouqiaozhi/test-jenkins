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
                  script{
                        // check the SONAR_ variables in all environment vars
                        def output = sh(returnStdout: true, script: 'env')
                        echo "Output: ${output}"    
                        
                        // or use directly
                        echo "${env.SONAR_HOST_URL}"
                        echo "${env.SONAR_CONFIG_NAME}"
                    }
                }
            }
        }
    }
}

