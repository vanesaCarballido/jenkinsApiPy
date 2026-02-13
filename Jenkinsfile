pipeline {
    agent any

    stages {
        stage('Crear job temporal en Kubernetes') {
            steps {
                sh '''
cat <<EOF > job.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: nodotemporal
spec:
  ttlSecondsAfterFinished: 0
  backoffLimit: 0
  template:
    spec:
      restartPolicy: Never
      containers:
      - name: hola
        image: busybox
        command: ["sh", "-c", "echo hola mundo"]
EOF

kubectl apply -f job.yaml
kubectl wait --for=condition=complete job/nodotemporal
kubectl logs job/nodotemporal
'''
            }
        }
    }
}
