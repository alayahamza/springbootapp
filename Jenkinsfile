pipeline {

    environment {
    registry = "alayahamza/spring-boot-app"
    registryCredential = 'f989b0bf-5644-46a0-9e9b-d01110aa1e29'
    }
    
    agent any

    stages {

        stage('Clone sources') {
            steps {
                git url: 'http://google-cloud-centos7/spring-angular-docker-app/springbootapp.git', credentialsId: '5f1ed169-39c6-42c6-82ca-78bb5a0aaaeb'
            }
        }

        stage('Build docker image') {
             steps {
                 sh '''
                 chmod +x jenkins/build/mvn.sh
                 chmod +x jenkins/build/build.sh
                 ./jenkins/build/mvn.sh mvn -DskipTests=true clean package
                 ./jenkins/build/build.sh
                 '''
            }
        }

        stage('Push docker image') {
             steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                    docker.image('alayahamza/spring-boot-app:latest').push()
                    }
                }
            }
        }
    }
}
