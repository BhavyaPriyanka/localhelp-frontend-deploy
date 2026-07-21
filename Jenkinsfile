pipeline{

    agent{
        label 'AGENT-1'
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        
    }

    parameters{

        string(

            name: 'VERSION',
            defaultValue: '',
            description: 'Frontend artifact version from Nexus'
        )
    }

    

    stages {

        stage('Environment Check') {
                    steps {
                        sh '''
                            echo "===== ENVIRONMENT ====="
                            hostname
                            pwd
                            whoami
                            terraform version
                '''
                    }
                }

            stage('Checkout Infrastructure') {
                    steps {
                        checkout scm
                    }
                }

        stage('PRINT THE VERSION') {
            steps {
               echo "APP VERSION IS: ${params.VERSION} "
            }
        }
    

        stage('Terraform INIT') {
                steps {
                sh """
                    cd terraform
                    terraform init
                """
                }
            }

              stage('Terraform Format and Validate') {
                        steps {
                            sh '''
                                cd terraform
                                terraform fmt 
                                terraform validate
                            '''
                        }
                    }

        stage('Terraform PLAN') {
            steps {
            sh """
                cd terraform
                terraform plan -var="app_version=${params.VERSION}"
            """
            }
        }

        stage('Terraform DEPLOY') {
            steps {
            sh """
                cd terraform
                terraform apply -auto-approve -var="app_version=${params.VERSION}" 
            """
            }
        }
        }

         post {

        always {
            deleteDir()
        }

        success {
            echo "Frontend ${params.VERSION} deployed successfully."
        }

        failure {
            echo "Frontend deployment failed."
        }
    }
}


