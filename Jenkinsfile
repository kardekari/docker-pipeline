pipeline {
  agent any

  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('abdullahcodes-dockerhub')
    SSH_KEY               = credentials('sshkey')
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

    stage('parallel'){
      parallel{
        stage("test-pylint"){
          steps{sh "docker run  --rm --name app_test_pylint abdullahcodes/docker-test:latest pylint app.py"}
        }
        stage("Test"){
          steps{sh "docker run  --rm --name test_app abdullahcodes/docker-test:latest pytest"}
        }
      }
    }

    // stage('Push') {
    //   steps {
    //     sh 'docker push abdullahcodes/docker-test:latest'
    //   }
    // }

    stage('bash_script'){
      steps{
        sh 'pwd'
        sh 'ls -l'
        sh 'env'
        sh './bash_script.sh'
      }
    }

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

