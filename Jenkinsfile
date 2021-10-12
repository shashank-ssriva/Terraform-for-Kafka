node {
    stage('Initialise Terraform') {
            sh script: '/opt/homebrew/bin/terraform init'
    }
    stage('Terraform plan') {
        withAWS(credentials: 'tf_user_ec2') {
    sh script: '/opt/homebrew/bin/terraform plan'
      }
    }
  stage('Terraform apply') {
        withAWS(credentials: 'tf_user_ec2') {
    sh script: '/opt/homebrew/bin/terraform apply -auto-approve'
      }
    }
   
}
