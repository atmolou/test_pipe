pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Проверка исходного кода из репозитория Git
              //   git url: 'https://github.com/your-repo/your-project.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Команда сборки. Здесь замените на команду, подходящую для вашего проекта
              //   sh './gradlew build'
            }
        }

        stage('Test') {
            steps {
                // Запуск тестов
                sh './gradlew test'
            }
            post {
                always {
                    // Публикация результатов тестов
                  //   junit 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                // Шаг развертывания (например, копирование артефактов на сервер)
                echo 'Deploying to production environment...'
                // Добавьте реальные шаги развертывания, например, SCP/SSH для копирования файлов
            }
        }
    }

    post {
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
