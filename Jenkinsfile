pipeline {
    agent {
        docker { image 'node:16' } // Use the Node.js Docker image as the build environment
    }
    environment {
        GITHUB_REPO = 'https://github.com/sandy193/Jenkins_docker_aws.git'
        DOCKER_IMAGE = 'sandydocker19/jenkins_docker_aws'         // Replace with your Docker Hub repo
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Pull code from GitHub
                git branch: 'main', url: "${GITHUB_REPO}"
            }
        }
        stage('Build App') {
            steps {
                // Install dependencies and build the application
                sh 'npm install'
                sh 'npm run build' // Adjust if your app does not have a build step
            }
        }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                sh 'docker build -t ${DOCKER_IMAGE}:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                // Log in to Docker Hub and push the image
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', 
                                  usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push ${DOCKER_IMAGE}:latest'
                }
            }
        }
        stage('Deploy Docker Container') {
            steps {
                // Stop and remove any existing container, then deploy a new one
                sh '''
                docker stop my-app || true
                docker rm my-app || true
                docker run -d --name my-app -p 3000:3000 ${DOCKER_IMAGE}:latest
                '''
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution completed!'
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
