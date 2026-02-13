pipeline {
    agent any

    stages {
        stage('Crear Job temporal') {
            steps {
                script {
                    sh 'kubectl apply -f job.yaml'

                    // Esperar a que termine el Job
                    sh '''
                    while [ $(kubectl get jobs nodotemporal -o jsonpath='{.status.succeeded}') != "1" ]; do
                        echo "Terminando el job..."
                        sleep 2
                    done
                    '''

                    // Mostrar los logs 
                    sh 'kubectl logs job/nodotemporal'

                    // Borrar el job
                    sh 'kubectl delete job nodotemporal'
                }
            }
        }
    }
}
