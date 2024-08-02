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

        stage('build & push image') {
            steps {
                sh 'docker build -t test .'
                sh 'docker tag test 10.103.133.104:5000/test'
                sh 'docker push 10.103.133.104:5000/test'
            }
        }

        stage('deploy') {
            steps {
                sh 'kubectl apply -f deploy/delpoy-main.yaml'
            }
        }
    }
}

