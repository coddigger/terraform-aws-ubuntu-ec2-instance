#! /bin/bash
sudo apt-get update
sudo apt install -y net-tools
#sudo apt-get install ubuntu-desktop -y
#sudo apt-get install -y apache2
#sudo systemctl start apache2
#sudo systemctl enable apache2
#echo "<h1>AWS Virtual Machine deployed with Terraform</h1>" | sudo tee /var/www/html/index.html

# VSCode
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install -y code

# Postman
sudo snap install postman

# Ansible
sudo apt install -y ansible

# Ubuntu Desktop
#sudo apt install -y lightdm ubuntu-mate-desktop xrdp
#sudo systemctl enable lightdm
#sudo systemctl enable xrdp

sudo apt -y autoremove
