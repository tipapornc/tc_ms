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
        sh "docker build -t ghcr.io/tipapornc/tc_ms ."
      }
    }
    stages('Deliver Docker Image') {
      agent {label 'build-server'}
      steps {
        withCredentials(
          [usernamePassword(
            credentialsId: 'tipapornc',
            passwordVariable: 'githubPassword',
            usernameVariable: 'githubUser'
          )]
        )
      }
        sh "docker login ghcr.io -u ${env.githubUser} -p ${env.githubPassword}"
        sh "docker push ghcr.io/tipapornc/tc_ms"
    }
  }
}