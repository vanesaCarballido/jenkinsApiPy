pipeline {
    agent any
    stages {
        stage('Crear pod') {
            steps {
                sh '''
                kubectl run hola-mundo --image=busybox --restart=Never -- echo "Hola Mundo desde el pod!"
                kubectl delete pod hola-mundo
                '''
            }
        }
    }
}
