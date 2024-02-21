pipeline {
    agent any
    
    stages {
        stage('fetch from repo') { 
            steps {
                git branch: 'master', url: 'https://github.com/c2-80511/project.git' 
            }
        }
        
        stage("Docker build") {
            steps {
                sh 'docker builder prune -a'
                sh 'docker version'
                sh 'docker build -t project .'
                sh 'docker image list'
                sh 'docker tag project rajatkokane/projectfinal:latest' // Tag with a specific version
            }
        }
        
        stage("Docker login") {
            environment {
                DOCKER_CREDENTIALS = credentials('a1a67991-4670-45fa-ad88-df90e20a2bf9')
            }
            steps {
                withCredentials([string(credentialsId: 'a1a67991-4670-45fa-ad88-df90e20a2bf9', variable: 'PASSWORD')]) {
                    sh "echo \$PASSWORD | docker login -u rajatkokane --password-stdin"
                }
            }
        }
        
        stage("Push Image to Docker Hub") {
            steps {
                sh 'docker push rajatkokane/projectfinal:latest' // Push the tagged image
            }
        }
        
        stage("Pull Image from Docker Hub") {
            steps {
                sh 'docker pull rajatkokane/projectfinal'
            }
        }
        stage("Deploy"){
            steps{
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
