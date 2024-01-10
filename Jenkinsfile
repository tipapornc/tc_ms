pipeline {
  agent any
  environment {
    APP_NAME = "test app name naja"
  }
  stages {
    stage('Build Image'){
        steps {
            sh "echo ${env.APP_NAME}"
        }
    }
    stage('Build Stage (Docker)') {
      agent {label 'build-server'}
      steps {
        sh "docker build -t ghcr.io/tipapornc/tc_ms:newest ."
      }
    }
  }
}