pipeline {
    agent any

    stages {
        stage('Hola mundo en pod temporal') {
            steps {
                sh '''
                POD=hola-$(date +%s)

                kubectl run $POD \
                  --image=alpine \
                  --restart=Never \
                  --rm -i \
                  -- echo "Hola mundo desde pod temporal"
                '''
            }
        }
    }
}
