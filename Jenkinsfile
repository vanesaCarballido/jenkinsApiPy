pipeline {
    agent any

    stages {
        stage('Build image') {
            steps {
                sh 'docker build -t notes-api .'
            }
        }

        stage('Deploy app') {
            steps {
                sh '''
                docker rm -f notes-api || true
                docker run -d -p 5001:5001 -v notes_data:/data --name notes-api notes-api
                '''
            }
        }
    }
}
