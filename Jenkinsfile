pipeline {
    agent {any}

    stages {
         stage('cleanWs') {
            steps {
                echo 'cleanWS'
                clean workspace before init
                cleanWs()
            }
        }
        stage('GitInit') {
            steps {
                echo 'GitInit'
                git branch 'main', url 'httpsgithub.comElad0109simple-webapp-nodejs-'
            }
        }
        stage('build') {
            steps {
                echo 'build'
               nodejs('nodejs') {
                    run build
                    sh npm  install
                }
            }
        }
        stage('test') {
            steps {
                echo 'test'
                nodejs('nodejs') {
                    run test
                    sh npm  run test
                }
               
            }
        }
         stage('display') {
            steps {
                echo 'display'
                nodejs('nodejs') {
                    run diply
                    sh npm  run start
                }
               
            }
        }
        
    }
}
