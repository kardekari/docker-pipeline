pipeline {
  agent any

  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('abdullahcodes-dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t abdullahcodes/docker-test:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    // stage('Push') {
    //   steps {
    //     sh 'docker push abdullahcodes/docker-test:latest'
    //   }
    // }

    stage('Deploy'){
      steps {
         sh '''#!/bin/bash
                 echo "hello world" 
         '''
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

