pipeline {
    agent any
    stages {
        stage ('User Input') {
            steps {
                script {
                    myStage = input message: 'What stage do you want to run now?', parameters: [AnsibleChoice(choices: 'Yes\nNo', description: '', name: 'Stage')]
                }
                echo myStage
            }
        }
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

    stage('Create Kafka Zookeeper EC2 instance') {
      when {
                expression { 
                   return params.Choice == 'Apply'
                }
            }
        
        steps {
            withAWS(credentials: 'tf_user_ec2') {
                sh '/Users/shashanksrivastava/terraform.sh'
            }
        }
    }

    stage('Install Kafka Zookeeper') {
        when {
                expression { 
                   return params.AnsibleChoice == 'Yes'
                }
            }
        steps {
            withAWS(credentials: 'tf_user_ec2') {
                sh '/Users/shashanksrivastava/terraform.sh'
            }
        }
    }

    stage('Destroy Kafka Zookeeper EC2 instance') {
      when {
                expression { 
                   return params.Choice == 'Destroy'
                }
            }
        
        steps {
            withAWS(credentials: 'tf_user_ec2') {
                sh '/opt/homebrew/bin/terraform destroy -auto-approve'
            }
        }
    }
}
}
