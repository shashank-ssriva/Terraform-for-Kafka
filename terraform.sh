#!/bin/bash
echo "Running Terraform apply & extracting the public IP..."
/opt/homebrew/bin/terraform apply -auto-approve > terraform_apply.txt

zookeeper_instance_public_ip=`grep zookeeper_instance_public_ip terraform_apply.txt | tail -1 | cut -f2 -d'=' | tr -d '"'`

echo "The public IP is $zookeeper_instance_public_ip. Updating Ansible hosts now."
echo $zookeeper_instance_public_ip ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/Users/shashanksrivastava/Downloads/kafka_ssh_key.pem >> /Users/shashanksrivastava/ansible_hosts
echo "The updated Ansbile hosts file is:"
cat /Users/shashanksrivastava/ansible_hosts
