pipeline {
  agent any

  stages {
    stage('Hola mundo en pod temporal') {
      steps {
        sh '''
          POD=hola-$(date +%s)

          kubectl run $POD \
            --image=reto3:latest \
            --image-pull-policy=IfNotPresent \
            --restart=Never \
            --command -- sh -c "echo Hola mundo desde Jenkins"

          kubectl logs $POD

          kubectl delete pod $POD
        '''
      }
    }
  }
}
