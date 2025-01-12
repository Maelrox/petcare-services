pipeline {
    agent any

    environment {
        // Set environment variables
        DOCKER_IMAGE = 'myapp'
        DOCKER_REGISTRY = 'my-docker-registry'  // If you use a private Docker registry, replace with the actual registry URL
        SWARM_SERVICE_NAME = 'myapp-service'  // Name of the service in Docker Swarm
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Pull the latest changes from the Git repository
                    git 'https://github.com/your-repository/myapp.git'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Spring Boot project using Gradle (you can replace this with Maven if needed)
                    sh './gradlew clean build'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image with the current version or build number
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            when {
                branch 'main'  // Only push on the main branch (you can modify this based on your branching strategy)
            }
            steps {
                script {
                    // Push the Docker image to the registry (if needed)
                    docker.withRegistry('https://my-docker-registry.com', 'my-docker-credentials') {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push()
                    }
                }
            }
        }

        stage('Deploy to Docker Swarm') {
            steps {
                script {
                    // Deploy the application to Docker Swarm
                    // First, ensure the Docker Swarm is initialized and the manager node is available
                    sh """
                        docker stack deploy -c docker-compose.yml ${SWARM_SERVICE_NAME}
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()  // Clean the workspace after each run
        }
    }
}
