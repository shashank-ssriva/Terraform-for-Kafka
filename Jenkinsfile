pipeline {
    agent any
    stages {
    stage('Initialise Terraform') {
        when {
                expression { 
                   return params.Choice == 'Init'
                }
            }
            steps {
                sh '/opt/homebrew/bin/terraform init'
            }
    }
    stage('Terraform plan') {
        when {
                expression { 
                   return params.Choice == 'Plan'
                }
            }
        
        steps {
            withAWS(credentials: 'tf_user_ec2') {
                sh '/opt/homebrew/bin/terraform plan'
            }
        }
      
    }
  stage('Terraform apply') {
      when {
                expression { 
                   return params.Choice == 'Apply'
                }
            }
        
        steps {
            withAWS(credentials: 'tf_user_ec2') {
                sh '/opt/homebrew/bin/terraform apply -auto-approve'
            }
        }
    }
}
}
