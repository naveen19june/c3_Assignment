pipeline{
    agent {label 'appserver'}
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/naveen19june/c3_Assignment.git']]])
            }
        }
        stage('build and push image to ecr'){
            steps{
                sh '''aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 734306698739.dkr.ecr.us-east-1.amazonaws.com
                docker build -t c3-repository .
                docker tag c3-repository:latest 734306698739.dkr.ecr.us-east-1.amazonaws.com/c3-repository:latest
                docker push 734306698739.dkr.ecr.us-east-1.amazonaws.com/c3-repository:latest'''
            }
        }
        stage('run container'){
            steps{
                sh '''docker run -d -p 8080:8080 734306698739.dkr.ecr.us-east-1.amazonaws.com/c3-repository:latest'''
            }
        }
}
}
