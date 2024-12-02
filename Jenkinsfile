pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning the repository...'
                git branch: 'main', url: 'https://github.com/sandy193/Jenkins_docker_aws.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t my-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running the Docker container...'
                sh '''
                docker run -d --name my-app-container -p 8080:80 my-app
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
