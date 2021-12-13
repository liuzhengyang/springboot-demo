pipeline {
    environment {
        imageName = "liuzhengyang/springboot-demo"
        registryCredential = 'docker-hub-credential'
        dockerImage = ''
    }
    agent {
        docker {
            image 'ubuntu'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh './mvnw clean install'
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
