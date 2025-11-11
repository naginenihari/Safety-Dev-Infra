component=$1
env=$2
dnf install ansible -y
REPO_URL=https://github.com/naginenihari/Ansible_Roboshop_Roles-Terraform.git
REPO_DIR=/opt/safety/ansible
ANSIBLE_DIR=Ansible_Roboshop_Roles-Terraform
LOG_PATH=/var/log/safety/ansible.log

mkdir -p $REPO_DIR
mkdir -p /var/log/safety
touch ansible.log

cd $REPO_DIR
if [ -d $ANSIBLE_DIR ]; then
   cd $ANSIBLE_DIR
   git pull
else
   git clone $REPO_URL
   cd $ANSIBLE_DIR
fi

ansible-playbook -e component=$component -e env=$env main.yaml