component=$1
dnf install ansible -y
ansible-pull -U https://github.com/naginenihari/Ansible_Roboshop_Roles-Terraform.git -e component=$component main.yaml
# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yaml