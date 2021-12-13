pipeline {
    environment {
        imageName = "liuzhengyang/springboot-demo"
        registryCredential = 'docker-hub-credential'
        dockerImage = ''
    }
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build image') {
            steps {
                script {
                      dockerImage = docker.build imageName
                }
            }
        }
        stage('Deploy image') {
            steps {
                script {
                    docker.withRegistry( 'http://hub-mirror.c.163.com', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
