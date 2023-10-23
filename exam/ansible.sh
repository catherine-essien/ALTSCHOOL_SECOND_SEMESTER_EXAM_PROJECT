 # To configure the PPA on your system and install Ansible on master run these commands:
 sudo apt update
 sudo apt install software-properties-common
 sudo add-apt-repository --yes --update ppa:ansible/ansible
 sudo apt install ansible

 #to check if ansible is running
 ansible -ver