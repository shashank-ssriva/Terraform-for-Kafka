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
                   return params.Choice == 'Install Kafka Zookeeper'
                }
            }
        steps {
                sh '/opt/homebrew/bin/ansible-playbook Ansible/install_kafka_zookeeper.yaml'
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
